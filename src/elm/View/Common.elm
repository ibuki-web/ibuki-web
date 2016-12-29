module View.Common exposing (..)

import Html exposing (Html)
import Monocle.Optional exposing (Optional)

mapFromChildHtml : Optional p c -> p -> Html c -> Html p
mapFromChildHtml optional noMessage = Html.map (\message -> optional.set message noMessage)