module Updater.Content.Experiment exposing (..)

import Model.Content.Experiment exposing (ExperimentModel)
import Updater.Content.ExperimentMessage exposing (ExperimentMessage)

experimentUpdate : ExperimentMessage -> ExperimentModel -> (ExperimentModel, Cmd ExperimentMessage)
experimentUpdate _ model =
  (model, Cmd.none)
