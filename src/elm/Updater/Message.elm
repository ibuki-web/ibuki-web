module Updater.Message exposing (..)

import Updater.Header.HeaderMessage exposing (HeaderMessage)

import Monocle.Optional exposing (Optional)

type Message
  = NoMessage
  | FromHeader HeaderMessage


headerMessageOpt : Optional Message HeaderMessage
headerMessageOpt =
  let
    getOption v =
      case v of
        FromHeader message -> Just message
        NoMessage -> Nothing
    set h v = FromHeader h
  in
    Optional getOption set
