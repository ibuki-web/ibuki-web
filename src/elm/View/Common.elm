module View.Common exposing (..)

import Html exposing (Html)
import Monocle.Optional exposing (Optional)

mapFromChildHtml : Optional p c -> p -> Html c -> Html p
mapFromChildHtml optional noMessage = Html.map (\message -> optional.set message noMessage)

toNoMessage : b -> Html a -> Html b
toNoMessage noMessage html = Html.map (\_ -> noMessage) html