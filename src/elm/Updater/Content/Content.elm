module Updater.Content.Content exposing (..)

import Updater.Content.ContentMessage exposing (..)
import Updater.UpdaterCommon exposing (..)
import Updater.Content.Timeline exposing (..)
import Model.Route exposing (..)
import Model.Content.Content exposing (..)

contentUpdate : ContentMessage -> ContentModel -> (ContentModel, Cmd ContentMessage)
contentUpdate message model =
  let
    timelineUpdaterShift =
      {
        modelShift = timelineModelOpt
      , messageShift = timelineMessageOpt
      , cmdMessageShift = FromTimeline
      }
    timelinePartialUpdater = makePartialUpdaterOO_ timelineUpdaterShift timelineUpdate message
  in
    andThen (routeUpdate message) (\m -> concatPartialUpdater m [
      timelinePartialUpdater
    ]) model

routeUpdate : ContentMessage -> ContentModel -> (ContentModel, Cmd ContentMessage)
routeUpdate message model =
  (case message of
    ChangeLocation location -> routeLens.set (parseLocation location) model

    _ -> model, Cmd.none)