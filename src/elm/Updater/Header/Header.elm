module Updater.Header.Header exposing (..)

import Http
import Updater.Api.Apis exposing (echoRequest, tagPostRequest, decodeErrorResponse)
import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)

headerUpdate : HeaderMessage -> HeaderModel -> (HeaderModel, Cmd HeaderMessage)
headerUpdate message model =
  case message of
    ChangeTagBody text ->
      ({model | tagBody = text}, Cmd.none)

    ButtonClicked text ->
      (model, Http.send PostTag (tagPostRequest text))

    ApplyEcho (Ok echoResponse) ->
      (buttonClickCountLens.set echoResponse.data model, Cmd.none)

    PostTag (Ok tagPostResponse) ->
      let
        tex = case tagPostResponse of
          Just body ->
            body.message

          Nothing ->
            "SUCCESS!!!!"
      in
        (buttonClickCountLens.set tex model, Cmd.none)

    PostTag (Err err) ->
      let
        message = case err of
          Http.BadStatus response ->
            case decodeErrorResponse response.body of
              Ok errorResponse ->
                errorResponse.message

              Err _ ->
                "error"

          _ ->
            "hoge"
      in
        (buttonClickCountLens.set message model, Cmd.none)

    _ ->
      (model, Cmd.none)
