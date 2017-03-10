module View.Common exposing (..)

import Html exposing (Attribute, Html)
import Html.Attributes exposing (property)
import Json.Encode as Json
import Monocle.Optional exposing (Optional)

mapFromChildHtml : Optional p c -> p -> Html c -> Html p
mapFromChildHtml optional noMessage = Html.map (\message -> optional.set message noMessage)

toNoMessage : b -> Html a -> Html b
toNoMessage noMessage html = Html.map (\_ -> noMessage) html


stringProperty : String -> String -> Attribute msg
stringProperty name string =
  property name (Json.string string)


ariaExpanded : String -> Attribute msg
ariaExpanded value =
   stringProperty "aria-expanded" value


role : String -> Attribute msg
role value =
   stringProperty "role" value


dataToggle : String -> Attribute msg
dataToggle value =
   stringProperty "data-toggle" value


dataTarget : String -> Attribute msg
dataTarget value =
   stringProperty "data-target" value

type alias Style = List (String, String)

s : List Style -> Style
s = List.concat
