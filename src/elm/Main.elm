import Html exposing (..)

import Time exposing (Time, second)

import View.View exposing (..)
import Model.Model exposing (..)
import Updater.Updater exposing (..)
import Updater.Message exposing (..)

import Updater.Header.HeaderMessage exposing (..)

-- APP
main : Program Never Model Message
main =
  Html.program { init = init, view = view, update = update, subscriptions = always Sub.none }

init : (Model, Cmd Message)
init = (initialModel, Cmd.none)

--subscriptions : Model -> Sub Message
--subscriptions model =
--  Time.every second (\_ -> FromHeader onClickMessage)
