module View.Content.Timeline.Timeline exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)

import Model.Content.Timeline exposing (..)
import Updater.Content.TimelineMessage exposing (..)
import View.Content.Timeline.Comment exposing (..)

timelineView : TimelineModel -> Html TimelineMessage
timelineView model =
  div [] [
    button [onClick onClickAddCommentButton] [
      h3 [] [text "Add Comment!!"]
    ]
  , div [] (List.map (\comment -> toNoMessage (commentView comment)) (commentsLens.get model))
  ]

toNoMessage : Html a -> Html TimelineMessage
toNoMessage html = Html.map (\_ -> NoMessage) html