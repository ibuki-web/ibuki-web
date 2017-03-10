module View.Content.Experiment.Experiment exposing (..)

import Html exposing (Html, h1, text)
import Model.Content.Experiment exposing (ExperimentModel)
import Updater.Content.ExperimentMessage exposing (ExperimentMessage)

experimentView : ExperimentModel -> Html ExperimentMessage
experimentView _ =
  h1 [] [text "experiment"]
