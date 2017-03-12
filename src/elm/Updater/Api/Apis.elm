module Updater.Api.Apis exposing (..)

import Http
import Json.Encode exposing (object)
import Json.Decode exposing (Decoder, field, at, map, map2, decodeString)

import Updater.Api.Api exposing (..)


(=>) : a -> b -> (a, b)
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


type alias ErrorCode =
  {
    code: Int
  , desc: String
  }


type alias ErrorResponse =
  {
    ecode: ErrorCode
  , message: String
  }


errorResponseDecoder : Decoder ErrorResponse
errorResponseDecoder =
  let
    code = at ["ecode", "code"] Json.Decode.int
    desc = at ["ecode", "desc"] Json.Decode.string
    message = at ["message"] Json.Decode.string
    ecode = map2 ErrorCode code desc
  in
    map2 ErrorResponse ecode message


decodeErrorResponse : String -> Result String ErrorResponse
decodeErrorResponse response =
  decodeString errorResponseDecoder response


type alias TagResponse =
  Maybe ErrorResponse


tagPostRequest : String -> Http.Request TagResponse
tagPostRequest body =
  Http.request <|
    baseRawRequest
      |>| url (host </> "tags")
      |>| post
      |>| jsonBody (object ["body" => Json.Encode.string body])
      |>| expect (Http.expectStringResponse tagPostExpect)


tagPostExpect : Http.Response String -> Result String TagResponse
tagPostExpect response =
  case response.status.code of
    201 ->
      Ok Nothing

    _ ->
      Err <| response.body
