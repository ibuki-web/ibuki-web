module Updater.Content.ContentMessage exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)
import Navigation exposing (..)

import Updater.Content.ExperimentMessage exposing (ExperimentMessage)
import Updater.Content.TimelineMessage exposing (..)
import Updater.Content.TopMessage exposing (TopMessage)


type ContentMessage
  = NoMessage
  | ChangeLocation Location
  | FromTop TopMessage
  | FromTimeline TimelineMessage
  | FromExperiment ExperimentMessage


topMessageOpt : Optional ContentMessage TopMessage
topMessageOpt =
  let
    getOption content =
      case content of
        FromTop top ->
          Just top

        _ ->
          Nothing

    set top content = FromTop top
  in
    Optional getOption set

timelineMessageOpt : Optional ContentMessage TimelineMessage
timelineMessageOpt =
  let
    getOption content =
      case content of
        FromTimeline timeline ->
          Just timeline

        _ ->
          Nothing

    set timeline content = FromTimeline timeline
  in
    Optional getOption set

experimentMessageOpt : Optional ContentMessage ExperimentMessage
experimentMessageOpt =
  let
    getOption content =
      case content of
        FromExperiment experiment ->
          Just experiment

        _ ->
          Nothing

    set experiment content = FromExperiment experiment
  in
    Optional getOption set