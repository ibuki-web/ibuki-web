import Html exposing (..)

import Navigation exposing (..)
import UrlParser exposing (Parser, parseHash, parsePath, map, top, s)

import View.View exposing (..)
import Model.Model exposing (..)
import Updater.Updater exposing (..)
import Updater.Message exposing (..)
import Model.Route exposing (..)
import Updater.Content.ContentMessage exposing (..)
import Updater.Header.HeaderMessage exposing (..)

-- APP
main : Program Never Model Message
main =
  Navigation.program (\loc -> FromContent (ChangeLocation loc)) { init = init, view = view, update = update, subscriptions = always Sub.none }

init : Location -> (Model, Cmd Message)
init location =
  let
    initialRoute = parseLocation location
  in
    (routeOfRootModelLens.set initialRoute initialModel, Cmd.none)

--subscriptions : Model -> Sub Message
--subscriptions model =
--  Time.every second (\_ -> FromHeader onClickMessage)
