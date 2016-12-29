module Model.Header.Header exposing (..)

import Monocle.Lens exposing (Lens)

type alias HeaderModel =
  {
    buttonClickCount: Int
  }

initialHeaderModel =
  {
    buttonClickCount = 0
  }

buttonClickCountLens : Lens HeaderModel Int
buttonClickCountLens =
  let
    get h = h.buttonClickCount
    set n h = { h | buttonClickCount = n }
  in
    Lens get set