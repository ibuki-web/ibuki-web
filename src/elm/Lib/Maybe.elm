module Lib.Maybe exposing(..)

flatMap : Maybe a -> (a -> Maybe b) -> Maybe b
flatMap maybe shift =
  case maybe of
    Just a -> shift a
    Nothing -> Nothing

(>>=) = flatMap

getOrElse : Maybe a -> a -> a
getOrElse maybe els =
  case maybe of
    Just some -> some
    Nothing -> els