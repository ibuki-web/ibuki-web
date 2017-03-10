module Updater.Content.ContentMessage exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)
import Navigation exposing (..)

import Updater.Content.ExperimentMessage exposing (ExperimentMessage)
import Updater.Content.TimelineMessage exposing (..)

type ContentMessage
  = NoMessage
  | ChangeLocation Location
  | FromTimeline TimelineMessage
  | FromExperiment ExperimentMessage

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

experimentMessageOpt : Optional ContentMessage ExperimentMessage
experimentMessageOpt =
  let
    getOption content =
      case content of
        FromExperiment experiment -> Just experiment
        _ -> Nothing
    set experiment content = FromExperiment experiment
  in
    Optional getOption set