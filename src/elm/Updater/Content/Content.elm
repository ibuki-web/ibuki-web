module Updater.Content.Content exposing (..)

import Updater.Content.ContentMessage exposing (..)
import Updater.UpdaterCommon exposing (..)
import Updater.Content.Timeline exposing (..)
import Model.Content.Content exposing (..)

contentUpdate : ContentMessage -> ContentModel -> ContentModel
contentUpdate message model =
  let
    timelinePartialUpdater = makePartialUpdaterOO timelineModelOpt timelineMessageOpt timelineUpdate message
  in
    concatPartialUpdater model [
      timelinePartialUpdater
    ]