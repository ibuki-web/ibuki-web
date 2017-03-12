module View.Content.Content exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)
import Model.Content.Content exposing (..)
import Model.Route exposing (..)
import Updater.Content.ContentMessage exposing (..)
import View.Common exposing (mapFromChildHtml)
import View.Content.Timeline.Timeline exposing (..)
import View.Content.Experiment.Experiment exposing (experimentView)
import View.Content.Top.Top exposing (topView)


(=>) = (,)


contentView : ContentModel -> Html ContentMessage
contentView model =
  let
    route = routeLens.get model
  in
    div [style ["height" => "100%", "weight" => "100%"]] [
      contentBodyView route model
    ]


contentBodyView : Route -> ContentModel -> Html ContentMessage
contentBodyView route model =
  let
    timelineModelMaybe =
      timelineModelOpt.getOption model

    mainContent =
      case route of
      Top ->
        case topModelOpt.getOption model of
          Just topModel ->
            mapFromChildHtml topMessageOpt NoMessage (topView topModel)

          Nothing ->
            div [] []

      Experiment ->
        case experimentModelOpt.getOption model of
          Just experimentModel ->
            mapFromChildHtml experimentMessageOpt NoMessage (experimentView experimentModel)

          Nothing ->
            div [] []

      Timeline ->
        case timelineModelOpt.getOption model of
          Just timelineModel ->
            mapFromChildHtml timelineMessageOpt NoMessage (timelineView timelineModel)

          Nothing ->
            div [] []

      _ ->
        h1 [] [text "This URL is not available :("]

    withTimeline content =
      div [style ["display" => "flex"]] [
        div [style ["overflow-y" => "auto", "position" => "fixed", "width" => "75%", "height" => "90%", "left" => "0"]] [
          mainContent
        ]
      , div [style ["overflow-y" => "auto", "position" => "fixed", "right" => "0", "height" => "90%", "width" => "25%"]] [
          case timelineModelOpt.getOption model of
            Just timelineModel ->
              mapFromChildHtml timelineMessageOpt NoMessage (timelineView timelineModel)

            Nothing ->
              div [] [
                text "This timeline is not available :("
              ]
        ]
      ]
  in
    case route of
      Top ->
        mainContent

      Timeline ->
        mainContent

      _ ->
        mainContent |> withTimeline
