-- MODEL


module Data exposing (..)


type Feedback
    = Positive
    | Negative
    | OtherFeedback String



{- TODO
   make the feedback optional by using a Maybe type. Read about it here:
   http://package.elm-lang.org/packages/elm-lang/core/latest/Maybe
   The feedback should then be a Maybe Feedback.
-}


type alias Merchant =
    { name : String
    , feedback : Feedback
    }


type alias Model =
    { merchants : List Merchant
    , currentMerchant : Merchant
    }


type Msg
    = SelectMerchant Merchant
