module Updater.Header.HeaderMessage exposing (..)

import Http exposing (Error)
import Updater.Api.Apis exposing (EchoResponse, TagResponse)


type HeaderMessage
  = NoMessage
  | ChangeTagBody String
  | ButtonClicked String
  | ApplyEcho (Result Error EchoResponse)
  | PostTag (Result Error TagResponse)


emptyHeaderMessage : HeaderMessage
emptyHeaderMessage =
  NoMessage


onClickButtonMessage : String -> HeaderMessage
onClickButtonMessage text =
  ButtonClicked text