module Updater.Header.HeaderMessage exposing (..)

import Http exposing (Error)
import Updater.Api.Apis exposing (EchoResponse)
import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)

type HeaderMessage
  = NoMessage
  | ButtonClicked
  | ApplyEcho (Result Error EchoResponse)


--buttonClickedLens : Lens HeaderMessage Bool
--buttonClickedLens =
--  let
--    get m = m.buttonClicked
--    set p m = { m | buttonClicked = p }
--  in
--    Lens get set


emptyHeaderMessage : HeaderMessage
emptyHeaderMessage =
  NoMessage


onClickButtonMessage : HeaderMessage
onClickButtonMessage =
  ButtonClicked