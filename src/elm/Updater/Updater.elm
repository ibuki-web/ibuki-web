module Updater.Updater exposing (..)

import Model.Model exposing (..)
import Updater.Message exposing (..)
import Updater.Header.Header exposing (..)
import Updater.Content.Content exposing (..)
import Updater.UpdaterCommon exposing (..)

update : Message -> Model -> (Model, Cmd Message)
update message model =
  let
    headerUpdaterShift =
      {
        modelShift = headerModelLens
      , messageShift = headerMessageOpt
      , cmdMessageShift = FromHeader
      }
    headerPartialUpdate = makePartialUpdaterLO_ headerUpdaterShift headerUpdate message
    contentUpdaterShift =
      {
        modelShift = contentModelLens
      , messageShift = contentMessageOpt
      , cmdMessageShift = FromContent
      }
    contentPartialUpdate = makePartialUpdaterLO_ contentUpdaterShift contentUpdate message
  in
    concatPartialUpdater model [
      headerPartialUpdate
    , contentPartialUpdate
    ]
