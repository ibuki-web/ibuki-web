module Updater.Api.Apis exposing (..)

import Http
import Json.Encode exposing (object)
import Json.Decode exposing (Decoder, field, map)

import Updater.Api.Api exposing (..)


(=>) = (,)


type alias EchoResponse =
  {
    data: String
  }

echoResponseDecoder : Decoder EchoResponse
echoResponseDecoder =
  let
    data = field "data" Json.Decode.string
  in
    map EchoResponse data

echoRequest : String -> Http.Request EchoResponse
echoRequest data =
  Http.request <|
    baseRawRequest
      |>| url (host </> "api" </> "echo")
      |>| post
      |>| jsonBody (object ["data" => Json.Encode.string data])
      |>| jsonBodyExpect echoResponseDecoder