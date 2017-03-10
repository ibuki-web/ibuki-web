module View.Header.Header exposing (..)

import Html exposing (Html, a, button, div, form, img, input, li, nav, p, span, text, ul)
import Html.Attributes exposing (alt, class, href, id, placeholder, src, style, type_)
import Html.Events exposing (onClick, onInput)

import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)
import View.Common exposing (Style, ariaExpanded, dataTarget, dataToggle, role)


(=>) = (,)


headerView : HeaderModel -> Html HeaderMessage
headerView m =
  nav [class "navbar navbar-default"] [
    div [class "container-fluid"] [
      div [class "navbar-header"] [
        button [class "navbar-toggle collapsed", dataToggle "collapse", dataTarget "#bs-example-navbar-collapse-1"] []
      , a [class "navbar-brand", href "#/"] [text "ibuki"]
      ]

    , div [class "collapse navbar-collapse", id "bs-example-navbar-collapse-1"] [
        ul [class "nav navbar-nav"] [
          li [] [
            a [href "#/hoge"] [text "hoge"]
          ]
        , li [] [
            a [href "#/experiment"] [text "experiment"]
          ]
        ]
      , form [class "navbar-form navbar-left", role "search"] [
          div [class "form-group"] [
            input [type_ "text", class "form-control", placeholder "Search"] []
          , button [type_ "submit", class "btn btn-default"] [text "Submit"]
          ]
        ]
      , ul [class "nav navbar-nav navbar-right"] [
          li [class "dropdown"] [
            a [href "#menu",class "dropdown-toggle", dataToggle "dropdown", role "button", ariaExpanded "false"] [
              text "Dropdown "
            , span [class "caret"] []
--              img [src "./static/img/user.svg", style ["height" => "38px", "weight" => "38px"]] []
            ]
          , ul [class "dropdown-menu", role "menu"] [
              li [] [ a [href "#menu"] [text "Home"] ]
            , li [] [ a [href "#menu"] [text "Hk"] ]
            , li [] [ a [href "#menu"] [text "afsje"] ]
            ]
          ]
        ]
      ]
    ]
  ]

headerView_ : HeaderModel -> Html HeaderMessage
headerView_ m =
  div [style styles.header] [
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


styles : {
          header: Style
         }
styles =
  {
    header = [
      "padding" => "4px"
    , "background" => "#eeffee"
    , "height" => "38px"
    , "width" => "100%"
    ]
  }