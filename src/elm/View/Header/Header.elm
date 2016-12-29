module View.Header.Header exposing (..)

import String exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)
import Updater.Header.Header exposing (..)
import View.Common exposing (..)

headerView : HeaderModel -> Html HeaderMessage
headerView m =
  div [class "Header"] [
    div [class "Header-component Header-content"] [
      p [] [text (clickedText (buttonClickCountLens.get m))]
    ]
  , div [class "Header-component header-content-switch"] [
      button [onClick onClickMessage] [
        h1 [] [text "Click Me!"]
      ]
    ]
  ]


clickedText : Int -> String
clickedText n = String.repeat n "!"