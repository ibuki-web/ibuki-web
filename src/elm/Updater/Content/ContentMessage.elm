module Updater.Content.ContentMessage exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)
import Navigation exposing (..)

import Updater.Content.TimelineMessage exposing (..)

type ContentMessage
  = NoMessage
  | ChangeLocation Location
  | FromTimeline TimelineMessage

timelineMessageOpt : Optional ContentMessage TimelineMessage
timelineMessageOpt =
  let
    getOption content =
      case content of
        FromTimeline timeline -> Just timeline
        _ -> Nothing
    set timeline content = FromTimeline timeline
  in
    Optional getOption set
