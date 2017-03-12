module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


type alias Model =
    Float


type Msg
    = Increment
    | Decrement
    | Multiply
    | Divide


main =
    beginnerProgram { model = 0, view = view, update = update }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Multiply ] [ text "*" ]
        , button [ onClick Divide ] [ text "/" ]
        ]


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Multiply ->
            model * 2

        Divide ->
            model / 2
