module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text, ul, li, Html, Attribute)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    , history : List Int
    }


type Msg
    = Increment
    | Decrement


model =
    Model 0 [ 0 ]


main =
    beginnerProgram { model = model, view = view, update = update }



{--
TODO add an html list which displays the history of the previous states.
Add (inline) style to style the list grey and with small font to be different from the rest.
Also remove the bullet points from the list.
--}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , div []
            -- [ ul [ { style = { listStyle = "none", backGround = "gray", fontSize = "small" } } ]
            [ ul []
                (List.take
                    10
                    (List.map (\entry -> li [] [ text (toString entry) ]) model.history)
                )
            ]
          {--TODO
            add history list here.
            Use List.map over the history to create the list items
            http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#map
            --}
        ]



{--
TODO put your style in this constant. use in the view function to attach it to the
list items
Check out the docs for the style function:
http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Attributes#style
--}


myStyle : Attribute Msg
myStyle =
    style []



{--
TODO Compete the update of the model by add the previous model state to the
history in each branch. You can use List.concat for that:
http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#concat
Also use List.take to restrict the history to 10 entries
--}


update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1, history = model.count :: model.history }

        Decrement ->
            { model | count = model.count - 1, history = model.count :: model.history }
