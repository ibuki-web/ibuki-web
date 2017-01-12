module Updater.Header.HeaderMessage exposing (..)

import Http exposing (Error)
import Updater.Api.Apis exposing (EchoResponse)


type HeaderMessage
  = NoMessage
  | ButtonClicked
  | ApplyEcho (Result Error EchoResponse)


emptyHeaderMessage : HeaderMessage
emptyHeaderMessage =
  NoMessage


onClickButtonMessage : HeaderMessage
onClickButtonMessage =
  ButtonClicked