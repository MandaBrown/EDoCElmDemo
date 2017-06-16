module Main exposing (..)

import Html exposing (Html, div, text, h1)
import Html.Events exposing (onClick)
import Keyboard


main : Program Never String EdocMsg
main =
    Html.program
        { init = ( "Hello, Erie Day of Code!", Cmd.none )
        , view = edocView
        , update = edocUpdate
        , subscriptions = edocSubs
        }



-- MODEL


type alias EdocModel =
    String



-- UPDATE


type EdocMsg
    = TitleClicked
    | KeyPressed


edocUpdate : EdocMsg -> EdocModel -> ( EdocModel, Cmd EdocMsg )
edocUpdate msg model =
    case msg of
        TitleClicked ->
            ( model ++ "!", Cmd.none )



-- VIEW


edocView : EdocModel -> Html EdocMsg
edocView model =
    h1 [ onClick TitleClicked ] [ text model ]



-- SUBSCRIPTIONS


edocSubs : String -> Sub EdocMsg
edocSubs str =
    Keyboard.downs KeyPressed
