import Navigation exposing (..)

import View.View exposing (..)
import Model.Model exposing (..)
import Updater.Updater exposing (..)
import Updater.Message exposing (..)
import Model.Route exposing (..)
import Updater.Content.ContentMessage exposing (..)

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

