module Model.Domain.Comment exposing (..)

import Monocle.Optional exposing (Optional)
import Monocle.Lens exposing (Lens, compose)

import Model.Domain.User exposing (..)

type alias CommentModel =
  {
    user: UserModel
  , title: Maybe String
  , body: String
  }

userLens : Lens CommentModel UserModel
userLens =
  let
    get r = r.user
    set u r = { r | user = u }
  in
    Lens get set

bodyLens : Lens CommentModel String
bodyLens =
  let
    get r = r.body
    set b r = { r | body = b }
  in
    Lens get set

titleOpt : Optional CommentModel String
titleOpt =
  let
    getOption r = r.title
    set t r = { r | title = Just t }
  in
    Optional getOption set

idOfCommentLens : Lens CommentModel String
idOfCommentLens = compose userLens idLens

nameOfCommentLens : Lens CommentModel String
nameOfCommentLens = compose userLens nameLens