module Updater.Message exposing (..)

import Updater.Header.HeaderMessage exposing (HeaderMessage)
import Updater.Content.ContentMessage exposing (ContentMessage)

import Monocle.Optional exposing (Optional)


type Message
  = NoMessage
  | FromHeader HeaderMessage
  | FromContent ContentMessage


headerMessageOpt : Optional Message HeaderMessage
headerMessageOpt =
  let
    getOption v =
      case v of
        FromHeader message -> Just message
        _ -> Nothing
    set h v = FromHeader h
  in
    Optional getOption set


contentMessageOpt : Optional Message ContentMessage
contentMessageOpt =
  let
    getOption v =
      case v of
        FromContent message -> Just message
        _ -> Nothing
    set c v = FromContent c
  in
    Optional getOption set