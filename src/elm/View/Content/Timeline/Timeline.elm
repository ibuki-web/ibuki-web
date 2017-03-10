module View.Content.Timeline.Timeline exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, style)
import Html.Events exposing (onClick)

import Model.Content.Timeline exposing (..)
import Updater.Content.TimelineMessage exposing (..)
import View.Content.Timeline.Comment exposing (..)
import View.Common exposing (..)

timelineView : TimelineModel -> Html TimelineMessage
timelineView model =
  div [] [
    button [onClick onClickAddCommentButton, class "btn btn-success", style [("text-color", "#fff")]] [
      text "Add Comment!!"
    ]
  , div [] (List.map (\comment -> toNoMessage NoMessage (commentView comment)) (commentsLens.get model))
  ]
