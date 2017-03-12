module Model.Domain.User exposing (..)

import Monocle.Lens exposing (Lens)

type alias UserModel =
  {
    id: String
  , name: String
  }

idLens : Lens UserModel String
idLens =
  let
    get m =
      m.id

    set i m =
      { m | id = i }
  in
    Lens get set

nameLens : Lens UserModel String
nameLens =
  let
    get m =
      m.name

    set n m =
      { m | name = n }
  in
    Lens get set