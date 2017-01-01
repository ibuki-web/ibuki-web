module Model.Model exposing (..)

import Monocle.Lens exposing (Lens, compose)

import Model.Header.Header exposing (HeaderModel, initialHeaderModel)
import Model.Content.Content exposing (ContentModel, initialContentModel, routeLens)
import Model.Route exposing (..)

type alias Model =
  {
    headerModel: HeaderModel
  , contentModel: ContentModel
  }

initialModel : Model
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

routeOfRootModelLens : Lens Model Route
routeOfRootModelLens = compose contentModelLens routeLens