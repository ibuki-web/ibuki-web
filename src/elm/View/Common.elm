module View.Common exposing (..)

import Html exposing (Attribute, Html)
import Html.Attributes exposing (attribute, property)
import Json.Encode as Json
import Monocle.Optional exposing (Optional)

mapFromChildHtml : Optional p c -> p -> Html c -> Html p
mapFromChildHtml optional noMessage = Html.map (\message -> optional.set message noMessage)

toNoMessage : b -> Html a -> Html b
toNoMessage noMessage html = Html.map (\_ -> noMessage) html


ariaLabelledby : String -> Attribute msg
ariaLabelledby =
   attribute "aria-labelledby"


ariaHaspopup : String -> Attribute msg
ariaHaspopup =
   attribute "aria-haspopup"


ariaExpanded : String -> Attribute msg
ariaExpanded =
   attribute "aria-expanded"


role : String -> Attribute msg
role =
   attribute "role"


dataToggle : String -> Attribute msg
dataToggle =
   attribute "data-toggle"


dataTarget : String -> Attribute msg
dataTarget =
   attribute "data-target"

type alias Style = List (String, String)

s : List Style -> Style
s = List.concat
