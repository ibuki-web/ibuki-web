module Model.Content.Content exposing (..)

import Monocle.Optional exposing (Optional)
import Model.Content.Timeline exposing (..)

type alias ContentModel =
  {
    timelineModel: Maybe TimelineModel
  }

initialContentModel : ContentModel
initialContentModel =
  {
    timelineModel = Just initialTimelineModel
  }

timelineModelOpt : Optional ContentModel TimelineModel
timelineModelOpt =
  let
    getOption content = content.timelineModel
    set timeline content = { content| timelineModel = Just timeline }
  in
    Optional getOption set
