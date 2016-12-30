module Updater.Content.ContentMessage exposing (..)

import Monocle.Optional exposing (Optional)

import Updater.Content.TimelineMessage exposing (..)

type ContentMessage
  = NoMessage
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