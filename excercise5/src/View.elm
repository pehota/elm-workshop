-- VIEW


module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, placeholder, type_)
import Html.Events exposing (onInput)
import Data exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [ class "header" ] [ text "Click on a merchant" ]
          {- TODO
             display the loaded customers here or the error if there is one
          -}
        , ul [] (List.map viewListItem model.customers)
        , input [ onInput SearchChange, type_ "text", placeholder "type search here" ] []
        ]


viewListItem : Customer -> Html Msg
viewListItem customer =
    li []
        [ text customer.name ]
