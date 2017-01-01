module Updater.Content.Content exposing (..)

import Updater.Content.ContentMessage exposing (..)
import Updater.UpdaterCommon exposing (..)
import Updater.Content.Timeline exposing (..)
import Updater.Route exposing (..)
import Model.Content.Content exposing (..)

import Updater.Content.ContentMessage exposing (..)
import Model.Content.Content exposing (..)

contentUpdate : ContentMessage -> ContentModel -> ContentModel
contentUpdate message model =
  let
    timelinePartialUpdater = makePartialUpdaterOO timelineModelOpt timelineMessageOpt timelineUpdate message
  in
    andThen (routeUpdate message) (\m -> concatPartialUpdater m [
      timelinePartialUpdater
    ]) model

routeUpdate : ContentMessage -> ContentModel -> ContentModel
routeUpdate message model =
  case message of
    ChangeLocation location -> routeLens.set (parseLocation location) model

    _ -> model