module Updater.Header.Header exposing (..)

import Http
import Updater.Api.Apis exposing (echoRequest)
import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)

headerUpdate : HeaderMessage -> HeaderModel -> (HeaderModel, Cmd HeaderMessage)
headerUpdate message model =
  case message of
    ButtonClicked ->
      (model, Http.send ApplyEcho (echoRequest "hogehogepun"))

    ApplyEcho (Ok echoResponse) ->
      (buttonClickCountLens.set (String.length echoResponse.data) model, Cmd.none)

    _ ->
      (model, Cmd.none)

onClickButton : HeaderModel -> HeaderModel
onClickButton model =
  let
    clickCount = buttonClickCountLens.get model
  in
    buttonClickCountLens.set (clickCount + 1) model