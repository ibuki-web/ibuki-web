module Model.Model exposing (..)

import Monocle.Lens exposing (Lens)

import Model.Header.Header exposing (HeaderModel, initialHeaderModel)

type alias Model =
  {
    headerModel: HeaderModel
  }

initialModel =
  {
    headerModel = initialHeaderModel
  }

headerModelLens : Lens Model HeaderModel
headerModelLens =
  let
    get m = m.headerModel
    set h m = { m | headerModel = h }
  in
    Lens get set