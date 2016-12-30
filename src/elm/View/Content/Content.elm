module View.Content.Content exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model.Content.Content exposing (..)
import Updater.Content.ContentMessage exposing (..)
import View.Content.Timeline.Timeline exposing (..)
import View.Common exposing (..)

contentView : ContentModel -> Html ContentMessage
contentView model =
  let
    timelineModelMaybe = timelineModelOpt.getOption model
  in
    div [] [
      case timelineModelMaybe of
        Just timelineModel -> mapFromChildHtml timelineMessageOpt NoMessage (timelineView timelineModel)
        Nothing -> div [] []
    ]