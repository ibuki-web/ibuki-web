module Updater.UpdaterCommon exposing (..)

import Lib.Maybe exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)

makePartialUpdaterLO : Lens pModel cModel -> Optional pMessage cMessage -> (cMessage -> cModel -> cModel) -> pMessage -> pModel -> pModel
makePartialUpdaterLO modelLens messageOpt childUpdate parentMessage parentModel =
  let
    messageMaybe = messageOpt.getOption parentMessage
    model = modelLens.get parentModel
  in
    case messageMaybe of
      Just message -> parentModel |> modelLens.set (childUpdate message model)
      Nothing -> parentModel

makePartialUpdaterOO : Optional pModel cModel -> Optional pMessage cMessage -> (cMessage -> cModel -> cModel) -> pMessage -> pModel -> pModel
makePartialUpdaterOO modelOpt messageOpt childUpdate parentMessage parentModel =
  let
    messageMaybe = messageOpt.getOption parentMessage
    modelMaybe = modelOpt.getOption parentModel
  in
    case messageMaybe of
      Just message -> case modelMaybe of
        Just model -> parentModel |> modelOpt.set (childUpdate message model)
        Nothing -> parentModel
      Nothing -> parentModel

concatPartialUpdater : m -> List (m -> m) -> m
concatPartialUpdater model us =
  List.foldl (\f n -> f n) model us