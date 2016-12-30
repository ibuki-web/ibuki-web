module View.View exposing (..)

import Html exposing (..)

import Model.Model exposing (..)
import Updater.Message exposing (..)
import View.Header.Header exposing (..)
import View.Content.Content exposing (..)
import View.Common exposing (..)

view : Model -> Html Message
view m =
  let
    headerModel = headerModelLens.get m
    contentModel = contentModelLens.get m
  in
    div [] [
      mapFromChildHtml headerMessageOpt NoMessage (headerView headerModel)
    , mapFromChildHtml contentMessageOpt NoMessage (contentView contentModel)
    ]