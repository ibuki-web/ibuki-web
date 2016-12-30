module View.Content.Timeline.Comment exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Lib.Maybe exposing (..)

import Model.Domain.Comment exposing (..)

commentView : CommentModel -> Html {}
commentView model =
  div [] [
    h3 [] [text (comment2string model)]
  ]

comment2string : CommentModel -> String
comment2string model =
  let
    id = idOfCommentLens.get model
    name = nameOfCommentLens.get model
    title = getOrElse (titleOpt.getOption model) "[NoTitle]"
    body = bodyLens.get model
  in
    id ++ ": " ++ name ++ "> " ++ title ++ " #" ++ body
