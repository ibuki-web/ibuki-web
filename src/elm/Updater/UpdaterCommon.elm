module Updater.UpdaterCommon exposing (..)

import Lib.Maybe exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)

type alias UpdaterShiftLO pMessage cMessage pModel cModel =
  {
    messageShift: Optional pMessage cMessage
  , modelShift: Lens pModel cModel
  , cmdMessageShift: (cMessage -> pMessage)
  }

type alias UpdaterShiftOO pMessage cMessage pModel cModel =
  {
    messageShift: Optional pMessage cMessage
  , modelShift: Optional pModel cModel
  , cmdMessageShift: (cMessage -> pMessage)
  }

type alias Updater message model = message -> model -> (model, Cmd message)

makePartialUpdaterLO_ : UpdaterShiftLO pMessage cMessage pModel cModel -> Updater cMessage cModel -> Updater pMessage pModel
makePartialUpdaterLO_ updaterShift childUpdater parentMessage parentModel =
  makePartialUpdaterLO updaterShift.modelShift updaterShift.messageShift childUpdater updaterShift.cmdMessageShift parentMessage parentModel

makePartialUpdaterLO : Lens pModel cModel -> Optional pMessage cMessage -> (cMessage -> cModel -> (cModel, Cmd cMessage)) -> (cMessage -> pMessage) -> pMessage -> pModel -> (pModel, Cmd pMessage)
makePartialUpdaterLO modelLens messageOpt childUpdate messageShift parentMessage parentModel =
  let
    messageMaybe = messageOpt.getOption parentMessage
    model = modelLens.get parentModel
    partialUpdater = case messageMaybe of
      Just message ->
        let
          (childModel, childMessage) = childUpdate message model
        in
          (parentModel |> modelLens.set childModel, childMessage)
      Nothing -> parentModel ! []
  in
    mapModelCmd messageShift partialUpdater

makePartialUpdaterOO_ : UpdaterShiftOO pMessage cMessage pModel cModel -> Updater cMessage cModel -> Updater pMessage pModel
makePartialUpdaterOO_ updaterShift childUpdater parentMessage parentModel =
  makePartialUpdaterOO updaterShift.modelShift updaterShift.messageShift childUpdater updaterShift.cmdMessageShift parentMessage parentModel

makePartialUpdaterOO : Optional pModel cModel -> Optional pMessage cMessage -> (cMessage -> cModel -> (cModel, Cmd cMessage)) -> (cMessage -> pMessage) -> pMessage -> pModel -> (pModel, Cmd pMessage)
makePartialUpdaterOO modelOpt messageOpt childUpdate messageShift parentMessage parentModel =
  let
    messageMaybe = messageOpt.getOption parentMessage
    modelMaybe = modelOpt.getOption parentModel
    partialUpdater = case messageMaybe of
      Just message -> case modelMaybe of
        Just model ->
          let
            (childModel, childMessage) = childUpdate message model
          in
            (parentModel |> modelOpt.set childModel, childMessage)
        Nothing -> parentModel ! []
      Nothing -> parentModel ! []
  in
    mapModelCmd messageShift partialUpdater

concatPartialUpdater : m -> List (m -> (m, Cmd ms)) -> (m, Cmd ms)
concatPartialUpdater model us =
  case (List.foldl combine (model, []) us) of
    (model, cmds) -> model ! cmds

combine : (model -> (model, Cmd message)) -> (model, List (Cmd message)) -> (model, List (Cmd message))
combine updt modelcmds =
  let
    (model, cmds) = modelcmds
    (updatedModel, cmd) = updt model
  in
    (updatedModel, cmd :: cmds)

mapModelCmd :  (cMessage -> pMessage) -> (pModel, Cmd cMessage) -> (pModel, Cmd pMessage)
mapModelCmd f child =
  let
    (parentModel, childCmd) = child
  in
    (parentModel, Cmd.map f childCmd)

andThen : (m -> (m, Cmd ms)) -> (m -> (m, Cmd ms)) -> m -> (m, Cmd ms)
andThen f g model =
  let
    (model1, cmd1) = f model
    (model2, cmd2) = g model1
  in
    model2 ! [cmd1, cmd2]
