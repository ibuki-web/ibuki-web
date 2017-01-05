module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String

import Http
import Json.Decode exposing (field, Decoder, map, decodeString)
import Json.Encode exposing (object)

import Updater.Api.Api exposing (..)
import Updater.Api.Apis exposing (..)


(=>) = (,)


all : Test
all =
    describe "Api calling test"
        [ describe "request creating test"
            [ test "要素２つのリストでattachParams" <|
              \() ->
                attachParams "http://ibuki-web.com" ["hoge" => "fuga", "pom" => "moge"]
                  |> Expect.equal "http://ibuki-web.com?hoge=fuga&pom=moge"

            , test "空リストでattachParams" <|
              \() ->
                attachParams "http://ibuki-web.com" []
                  |> Expect.equal "http://ibuki-web.com"

            , test "baseRawRequestをPOSTに変換" <|
              \() ->
                baseRawRequest |>| post
                  |> Expect.equal { baseRawRequest | method = "POST" }

            , test "baseRawRequestをPOSTに変換した後さらにGETに変換" <|
              \() ->
                baseRawRequest |>| post |>| get
                  |> Expect.equal { baseRawRequest | method = "GET" }

            , test "baseRawRequestのURLとメソッドを変換" <|
              \() ->
                let
                  changedUrl = "http://changed.com"
                in
                  baseRawRequest |>| url changedUrl |>| post
                    |> Expect.equal { baseRawRequest | url = changedUrl, method = "POST" }

            , test "expect from decoder" <|
              \() ->
                (baseRawRequest |>| post |>| jsonBodyExpect echoResponseDecoder).method
                  |> Expect.equal "POST"

            , test "decoder test" <|
              \() ->
                decodeString echoResponseDecoder """{"data": "test"}"""
                  |> Expect.equal (Ok {data = "test"})

            ]
        ]
