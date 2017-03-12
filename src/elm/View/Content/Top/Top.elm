module View.Content.Top.Top exposing (..)

import Html exposing (Html, div, h1, img, li, text)
import Html.Attributes exposing (height, src, style, width)
import Model.Content.Top exposing (TopModel)
import Updater.Content.TopMessage exposing (TopMessage)
import View.Common exposing (Style, s)

(=>) = (,)

topView : TopModel -> Html TopMessage
topView _ =
  div [style <| s [styles.centerize, styles.background, styles.top]] [
    logo
  ]


logo : Html TopMessage
logo =
  img [src "./static/img/leaves.svg", style styles.logo] []


styles : {  top: Style
          , centerize : Style
          , background: Style
          , logo : Style}
styles =
  {
    top = [
      "height" => "100%"
    , "width" => "100%"
    ]

  , centerize = [
      "display" => "flex"
    , "justify-content" => "center"
    , "align-items" => "center"
    ]

  , background = [
      "background" => "#eeffee"
    ]

  , logo = [
      "margin" => "auto auto"
    , "height" => "100px"
    , "width" => "100px"
    ]
  }