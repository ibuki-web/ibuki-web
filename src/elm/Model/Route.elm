module Model.Route exposing (..)

import Navigation exposing (..)
import UrlParser exposing (..)

type Route
  = Top
  | Hoge

(||>) path route = path |> map route

matchers : Parser (Route -> a) a
matchers =
    oneOf [
      s "/"      ||> Top
    , s "hoge"   ||> Hoge
    ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            Top
