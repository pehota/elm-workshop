module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Data exposing (..)
import View
import Json.Decode exposing (Decoder, list, map3, field, string, int)


{-
   TODO import the Http module here
-}

import Http


main =
    Html.program
        { init = init
        , view = View.view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    {- TODO
       prepare the request data to send along with the HTTP request
       Use a GET to http:localhost:3000/customers
       Read about the HTTP module here:
       http://package.elm-lang.org/packages/elm-lang/http/latest
       and the doc is here:
       http://package.elm-lang.org/packages/elm-lang/http/1.0.0/Http
    -}
    let
        request =
            Http.get "http:localhost:3000/customers" decodeData
    in
        ( Model "" [] Nothing, Http.send DataLoaded request )



{- TODO
   write a decoder for the json response which decodes a (List Customer) type
   Use the imported from JSON.Decode at the top of the file.
   Also check:
   http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
   The first field is already there.
-}


decodeData : Decoder (List Customer)
decodeData =
    list
        (map3
            Customer
            (field "id" string)
        )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        {- TODO
           Handle the DataLoaded Msg the result Ok or Error. Set the customers on the model on Ok
           or set the error on failure.
        -}
        DataLoaded Ok customers ->
        DataLoaded Err err ->

        SearchChange searchTerm ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
