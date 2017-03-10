module View.Content.Content exposing (..)

import Html exposing (..)

import Model.Content.Content exposing (..)
import Model.Route exposing (..)
import Updater.Content.ContentMessage exposing (..)
import View.Content.Timeline.Timeline exposing (..)
import View.Common exposing (..)
import View.Content.Experiment.Experiment exposing (experimentView)

contentView : ContentModel -> Html ContentMessage
contentView model =
  let
    route = routeLens.get model
  in
    div [] [
      contentBodyView route model
    ]

contentBodyView : Route -> ContentModel -> Html ContentMessage
contentBodyView route model =
  let
    timelineModelMaybe = timelineModelOpt.getOption model
  in
    case route of
      Top ->
        case timelineModelMaybe of
          Just timelineModel -> mapFromChildHtml timelineMessageOpt NoMessage (timelineView timelineModel)
          Nothing -> div [] []

      Experiment ->
        case experimentModelOpt.getOption model of
          Just experimentModel -> mapFromChildHtml experimentMessageOpt NoMessage (experimentView experimentModel)
          Nothing -> div [] []

      Hoge ->
        span [] [text "Hoge!!!!!!!!!!!"]