module Model.Model exposing (..)

import Monocle.Lens exposing (Lens)

import Model.Header.Header exposing (HeaderModel, initialHeaderModel)
import Model.Content.Content exposing (ContentModel, initialContentModel)

type alias Model =
  {
    headerModel: HeaderModel
  , contentModel: ContentModel
  }

initialModel =
  {
    headerModel = initialHeaderModel
  , contentModel = initialContentModel
  }

headerModelLens : Lens Model HeaderModel
headerModelLens =
  let
    get m = m.headerModel
    set h m = { m | headerModel = h }
  in
    Lens get set

contentModelLens : Lens Model ContentModel
contentModelLens =
  let
    get m = m.contentModel
    set c m = { m | contentModel = c }
  in
    Lens get set