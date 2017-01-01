module Updater.Route exposing (..)

import Navigation exposing (..)
import UrlParser exposing (Parser, parseHash, parsePath, map, top, s)

import Model.Route exposing (..)

matchers : Parser (Route -> a) a
matchers =
    UrlParser.oneOf
        [ map Top top
        , map Hoge <| s "hoge"
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            Top