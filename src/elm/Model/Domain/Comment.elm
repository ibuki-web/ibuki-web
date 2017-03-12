module Model.Domain.Comment exposing (..)

import Monocle.Optional exposing (Optional)
import Monocle.Lens exposing (Lens, compose)

import Model.Domain.User exposing (..)

type alias CommentModel =
  {
    user: UserModel
  , topicName: String
  , isImportant: Bool
  , stared: Bool
  , date: String
  , title: Maybe String
  , body: String
  }


userLens : Lens CommentModel UserModel
userLens =
  let
    get r =
      r.user

    set u r =
      { r | user = u }
  in
    Lens get set


bodyLens : Lens CommentModel String
bodyLens =
  let
    get r =
      r.body

    set b r =
      { r | body = b }
  in
    Lens get set


topicNameLens : Lens CommentModel String
topicNameLens =
  let
    get r =
      r.topicName

    set b r =
      { r | topicName = b }
  in
    Lens get set


isImportantLens : Lens CommentModel Bool
isImportantLens =
  let
    get r =
      r.isImportant

    set i r =
      { r | isImportant = i }
  in
    Lens get set


staredLens : Lens CommentModel Bool
staredLens =
  let
    get r =
      r.stared

    set b r =
      { r | stared = b }
  in
    Lens get set


dateLens : Lens CommentModel String
dateLens =
  let
    get r =
      r.date

    set b r =
      { r | date = b }
  in
    Lens get set


titleOpt : Optional CommentModel String
titleOpt =
  let
    getOption r =
      r.title

    set t r =
      { r | title = Just t }
  in
    Optional getOption set


idOfCommentLens : Lens CommentModel String
idOfCommentLens =
  compose userLens idLens


nameOfCommentLens : Lens CommentModel String
nameOfCommentLens =
  compose userLens nameLens