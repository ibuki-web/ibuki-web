module Updater.Updater exposing (..)

import Monocle.Optional exposing (Optional)
import Monocle.Lens exposing (Lens)

import Model.Model exposing (..)
import Updater.Message exposing (..)
import Updater.Header.Header exposing (..)
import Updater.Content.Content exposing (..)
import Updater.UpdaterCommon exposing (..)

update : Message -> Model -> Model
update message model =
  let
    headerPartialUpdate = makePartialUpdaterLO headerModelLens headerMessageOpt headerUpdate message
    contentPartialUpdate = makePartialUpdaterLO contentModelLens contentMessageOpt contentUpdate message
  in
    List.foldl (\upd mdl -> upd mdl) model [
      headerPartialUpdate
    , contentPartialUpdate
    ]
