module Updater.Header.HeaderMessage exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)

type alias HeaderMessage =
  {
    buttonClicked: Bool
  }


buttonClickedLens : Lens HeaderMessage Bool
buttonClickedLens =
  let
    get m = m.buttonClicked
    set p m = { m | buttonClicked = p }
  in
    Lens get set


emptyHeaderMessage : HeaderMessage
emptyHeaderMessage =
  {
    buttonClicked = False
  }


onClickMessage : HeaderMessage
onClickMessage =
  buttonClickedLens.set True emptyHeaderMessage