module Updater.Header.Header exposing (..)

import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)

headerUpdate : HeaderMessage -> HeaderModel -> (HeaderModel, Cmd HeaderMessage)
headerUpdate message model =
  let
    buttonClicked = buttonClickedLens.get message
  in
    (if buttonClicked then onClickButton model else model, Cmd.none)

onClickButton : HeaderModel -> HeaderModel
onClickButton model =
  let
    clickCount = buttonClickCountLens.get model
  in
    buttonClickCountLens.set (clickCount + 1) model