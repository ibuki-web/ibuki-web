module View.Content.Timeline.Comment exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Lib.Maybe exposing (..)
import Model.Domain.Comment exposing (..)

commentView : CommentModel -> Html {}
commentView model =
  div [class "panel panel-default com"] [
    commentAttrView model
  , div [class "divider"] []
  , commentBodyView model
  ]


commentAttrView : CommentModel -> Html {}
commentAttrView model =
  let
    id = idOfCommentLens.get model
    name = nameOfCommentLens.get model
    topicName = topicNameLens.get model
    isImportant = isImportantLens.get model
    stared = staredLens.get model
    date = dateLens.get model
  in
    div [class "panel-body"] [
      div [class "topic-attr"] [
        div [class "attribute-text topic-name"] [
          text topicName
        ]
      , div [class "attribute-img important-marker"] [
          if isImportant then
            img [src "./static/img/attention-sign.svg"] []
          else
            span [] []
        ]
      ]

    , div [class "user-attr"] [
        div [class "attribute-img user-icon"] [
          img [src "./static/img/user.svg"] []
        ]
      , div [class "attribute-text user-name"] [
          text name
        ]
      , div [class "attribute-text user-id"] [
          text id
        ]
      ]

    , div [class "comment-attr"] [
        div [class "attribute-img like"] [
          if stared then
            img [src "./static/img/star.svg"] []
          else
            span [] []
        ]
      , div [class "attribute-text date"] [
          text date
        ]
      ]
    ]


commentBodyView : CommentModel -> Html {}
commentBodyView model =
  let
    title = getOrElse (titleOpt.getOption model) "[NoTitle]"
    body = bodyLens.get model
  in
    div [class "panel-body"] [
      div [class "title"] [
        text title
      ]
    , div [class "body"] [
        text body
      ]
    ]