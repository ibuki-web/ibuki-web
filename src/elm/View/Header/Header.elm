module View.Header.Header exposing (..)

import Html exposing (Html, a, button, div, form, img, input, li, nav, p, span, text, ul)
import Html.Attributes exposing (alt, attribute, class, href, id, placeholder, src, style, type_)
import Html.Events exposing (onClick, onInput)

import Model.Header.Header exposing (..)
import Updater.Header.HeaderMessage exposing (..)
import View.Common exposing (Style, ariaExpanded, ariaHaspopup, ariaLabelledby, dataTarget, dataToggle, role)


(=>) = (,)

headerView : HeaderModel -> Html HeaderMessage
headerView m =
  nav [class "navbar navbar-default"] [
    div [class "container-fluid"] [
      div [class "navbar-header"] [
        button [class "navbar-toggle collapsed", dataToggle "collapse", dataTarget "#header-navbar-collapse"] [
          span [class "sr-only"] [text "Toggle naviagtion"]
        , span [class "icon-bar"] []
        , span [class "icon-bar"] []
        , span [class "icon-bar"] []
        ]
      , a [class "navbar-brand", href "#/"] [text "ibuki"]
      ]

    , div [class "collapse navbar-collapse", id "header-navbar-collapse"] [
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
          li [] [
            div [class "dropdown", style ["margin-top" => "6px"]] [
              button [class "btn btn-default dropdown-toggle", type_ "button", id "dropdownmenu", dataToggle "dropdown"] [
                text "Dropdown", span [class "caret"] []
              ]
            , ul [class "dropdown-menu", ariaLabelledby "dropdownmenu"] [
                li [] [a [href "#"] [text "one"]]
              , li [] [a [href "#"] [text "two"]]
              , li [class "divider"] []
              , li [] [a [href "#"] [text "three"]]
              ]
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