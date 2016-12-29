import Html exposing (..)

import View.View exposing (..)
import Model.Model exposing (..)
import Updater.Updater exposing (..)
import Updater.Message exposing (..)

-- APP
main : Program Never Model Message
main =
  Html.beginnerProgram { model = initialModel, view = view, update = update }
