module Updater.Content.Top exposing (..)

import Model.Content.Top exposing (TopModel)
import Updater.Content.TopMessage exposing (TopMessage)

topUpdate : TopMessage -> TopModel -> (TopModel, Cmd TopMessage)
topUpdate _ model =
  (model, Cmd.none)