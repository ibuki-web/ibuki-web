module Updater.Content.Timeline exposing (..)

import Model.Content.Content exposing (ContentModel)
import Updater.Content.TimelineMessage exposing (..)
import Model.Content.Timeline exposing (..)

timelineUpdate : TimelineMessage -> TimelineModel -> (TimelineModel, Cmd TimelineMessage)
timelineUpdate message model =
  let
    showedComments = commentsLens.get model
  in
    (case message of
      AddComment comment -> commentsLens.set (comment :: showedComments) model
      NoMessage -> model, Cmd.none)