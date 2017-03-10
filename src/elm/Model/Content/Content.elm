module Model.Content.Content exposing (..)

import Model.Content.Experiment exposing (ExperimentModel, initialExperimentModel)
import Monocle.Optional exposing (Optional)
import Monocle.Lens exposing (Lens)

import Model.Content.Timeline exposing (..)
import Model.Route exposing (..)

type alias ContentModel =
  {
    timelineModel: Maybe TimelineModel
  , experimentModel: Maybe ExperimentModel
  , route: Route
  }

initialContentModel : ContentModel
initialContentModel =
  {
    timelineModel = Just initialTimelineModel
  , experimentModel = Just initialExperimentModel
  , route = Top
  }

timelineModelOpt : Optional ContentModel TimelineModel
timelineModelOpt =
  let
    getOption content = content.timelineModel
    set timeline content = { content| timelineModel = Just timeline }
  in
    Optional getOption set

experimentModelOpt : Optional ContentModel ExperimentModel
experimentModelOpt =
  let
    getOption content = content.experimentModel
    set experiment content = { content| experimentModel = Just experiment }
  in
    Optional getOption set

routeLens : Lens ContentModel Route
routeLens =
  let
    get m = m.route
    set r m = { m | route = r }
  in
    Lens get set