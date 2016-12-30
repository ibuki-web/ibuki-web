module Model.Content.Timeline exposing (..)

import Monocle.Lens exposing (Lens)
import Model.Domain.Comment exposing (..)

type alias TimelineModel =
  {
    comments: List CommentModel
  }

initialTimelineModel =
  {
    comments = []
  }

commentsLens : Lens TimelineModel (List CommentModel)
commentsLens =
  let
    get content = content.comments
    set comments content = { content| comments = comments }
  in
    Lens get set
