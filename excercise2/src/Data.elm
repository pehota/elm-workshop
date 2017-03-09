-- MODEL


module Data exposing (..)


type alias Model =
    { dieFace : Int
    }


type Msg
    = Roll
    | NewFace Int
