module Updater.Api.Api exposing (..)

import Http
import Json.Encode as JsonEncode
import Json.Decode as JsonDecode
import Time exposing (..)

import Lib.Maybe exposing (..)

type alias Url = String
type alias Param = (String, String)
type alias RawRequest a =
  {
    method : String,
    headers : List Http.Header,
    url : String,
    body : Http.Body,
    expect : Http.Expect a,
    timeout : Maybe Time,
    withCredentials : Bool
  }


host : Url
host = "http://localhost:9292"


(</>) : Url -> String -> Url
(</>) url string = url ++ "/" ++ string

baseRawRequest : RawRequest a
baseRawRequest =
  {
    method = "GET",
    headers = [],
    url = host,
    body = Http.emptyBody,
    expect = Http.expectStringResponse (\_ -> Err "Set the \"expect\" to baseRawRequest"),
    timeout = Nothing,
    withCredentials = False
  }


(|>|) : RawRequest a -> (RawRequest a -> RawRequest a) -> RawRequest a
(|>|) rawRequest f = f rawRequest


infixl 7 |>|


get : RawRequest a -> RawRequest a
get rr =
  { rr | method = "GET" }


post : RawRequest a -> RawRequest a
post rr =
  { rr | method = "POST" }


url : Url -> RawRequest a -> RawRequest a
url url rr =
  { rr | url = url }


params : List Param -> RawRequest a -> RawRequest a
params ps rr =
  url (attachParams host ps) rr


timeout : Time -> RawRequest a -> RawRequest a
timeout timeout rr =
  { rr | timeout = Just timeout }


expect : Http.Expect b -> RawRequest a -> RawRequest b
expect expect rr =
  { rr | expect = expect }


jsonBody : JsonEncode.Value -> RawRequest a -> RawRequest a
jsonBody body rr =
  { rr | body = Http.jsonBody body }


jsonBodyExpect : JsonDecode.Decoder b -> RawRequest a -> RawRequest b
jsonBodyExpect decoder rr =
  let
    expectJson = Http.expectStringResponse (\response -> JsonDecode.decodeString decoder response.body)
  in
    { rr | expect = expectJson }


isAllowedParams : (Param -> Bool) -> List Param -> Bool
isAllowedParams p params =
  List.all p params


attachParams : Url -> List Param -> Url
attachParams originUri params =
  let
    paramsPart_ = List.foldl (\(key, value) acc -> acc ++ "&" ++ key ++ "=" ++ value) "" params
    paramsPart = String.dropLeft 1 paramsPart_
  in
    if String.isEmpty paramsPart then
      originUri
    else
      originUri ++ "?" ++ paramsPart