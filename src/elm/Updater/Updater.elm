module Updater.Updater exposing (..)

import Model.Model exposing (..)
import Updater.Message exposing (..)
import Updater.Header.Header exposing (..)

update : Message -> Model -> Model
update message model =
  let
    headerMessageMaybe = headerMessageOpt.getOption message
    headerModel = headerModelLens.get model
  in
    case headerMessageMaybe of
      Just headerMessage -> model |> headerModelLens.set (headerUpdate headerMessage headerModel)
      Nothing -> model