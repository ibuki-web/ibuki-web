module Model.Route exposing (..)

import Navigation exposing (..)
import Resource.Route exposing (routes)
import UrlParser exposing (..)

type Route
  = NoRoute
  | Top
  | Timeline
  | Experiment


(||>) path route = path |> map route


matchers : Parser (Route -> a) a
matchers =
    oneOf [
      s routes.top        ||> Top
    , s routes.experiment ||> Experiment
    , s routes.timeline   ||> Timeline
    ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NoRoute
