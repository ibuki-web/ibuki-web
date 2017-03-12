module Updater.Content.TimelineMessage exposing (..)

import Model.Domain.Comment exposing (..)
import Model.Domain.User exposing (..)

type TimelineMessage
  = NoMessage
  | AddComment CommentModel

mockComment : CommentModel
mockComment =
  {
    user = {
      id = "@poe"
    , name = "pompom"
    }
  , topicName = "topic name"
  , isImportant = True
  , stared = True
  , date = "2017/01/01"
  , title = Just "this is a title"
  , body = "body yeah!"
  }

onClickAddCommentButton : TimelineMessage
onClickAddCommentButton =
  AddComment mockComment