module Model.Header.Header exposing (..)

import Monocle.Lens exposing (Lens)

type alias HeaderModel =
  {
    buttonClickCount: String
  , tagBody: String
  }

initialHeaderModel =
  {
    buttonClickCount = ""
  , tagBody = ""
  }

buttonClickCountLens : Lens HeaderModel String
buttonClickCountLens =
  let
    get h = h.buttonClickCount
    set n h = { h | buttonClickCount = n }
  in
    Lens get set