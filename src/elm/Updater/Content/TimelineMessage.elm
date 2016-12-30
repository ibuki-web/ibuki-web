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
  , title = Just "this is a title"
  , body = "body yeah!"
  }

onClickAddCommentButton : TimelineMessage
onClickAddCommentButton = AddComment mockComment