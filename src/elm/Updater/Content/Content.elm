module Updater.Content.Content exposing (..)

import Updater.Content.ContentMessage exposing (..)
import Updater.Content.Experiment exposing (experimentUpdate)
import Updater.UpdaterCommon exposing (..)
import Updater.Content.Timeline exposing (..)
import Model.Route exposing (..)
import Model.Content.Content exposing (..)
import Updater.Content.Top exposing (topUpdate)

contentUpdate : ContentMessage -> ContentModel -> (ContentModel, Cmd ContentMessage)
contentUpdate message model =
  let
    topUpdaterShift =
      {
        modelShift = topModelOpt
      , messageShift = topMessageOpt
      , cmdMessageShift = FromTop
      }
    topPartialUpdater = makePartialUpdaterOO_ topUpdaterShift topUpdate message

    timelineUpdaterShift =
      {
        modelShift = timelineModelOpt
      , messageShift = timelineMessageOpt
      , cmdMessageShift = FromTimeline
      }
    timelinePartialUpdater = makePartialUpdaterOO_ timelineUpdaterShift timelineUpdate message

    experimentUpdaterShift =
      {
        modelShift = experimentModelOpt
      , messageShift = experimentMessageOpt
      , cmdMessageShift = FromExperiment
      }
    experimentPartialUpdater = makePartialUpdaterOO_ experimentUpdaterShift experimentUpdate message
  in
    andThen (routeUpdate message) (\m -> concatPartialUpdater m [
      topPartialUpdater
    , timelinePartialUpdater
    , experimentPartialUpdater
    ]) model


routeUpdate : ContentMessage -> ContentModel -> (ContentModel, Cmd ContentMessage)
routeUpdate message model =
  case message of
    ChangeLocation location ->
      case parseLocation location of
        NoRoute ->
          model

        _ as loc ->
          routeLens.set loc model

    _ -> model, Cmd.none