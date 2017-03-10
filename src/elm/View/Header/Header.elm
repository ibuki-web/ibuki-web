module View.Header.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)


headerView : HeaderModel -> Html HeaderMessage
headerView m =
  div [class "Header"] [
    div [class "Header-component Header-content"] [
      p [] [text m.buttonClickCount]
    ]
  , div [class "Header-component Header-content-switch"] [
      button [onClick <| onClickButtonMessage m.tagBody] [
        img [alt "magnifier", src "./static/img/magnifier.svg"] []
      ]
    , input [ placeholder "Text to reverse", onInput ChangeTagBody] []
    ]
  , div [class "Header-component Header-user-pulldown"] [
      img [alt "user", src "./static/img/user.svg"] []
    ]
  ]


clickedText : Int -> String
clickedText n = toString n