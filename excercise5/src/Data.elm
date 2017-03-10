-- MODEL


module Data exposing (..)


type alias CustomersId =
    String


type alias Customer =
    { id : CustomersId
    , name : String
    , purchases : Int
    }


type alias CustomerList =
    List Customer


type alias Model =
    { searchTerm : String
    , customers : CustomerList
    , error : Maybe String
    }


type Msg
    = DataLoaded CustomerList
    | SearchChange String
