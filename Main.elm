module Main exposing (..)

import Html exposing (Html, div, text, h1)
import Html.Events exposing (onClick)


main : Program Never String EdocMsg
main =
    Html.beginnerProgram
        { model = "Hello, Erie Day of Code!"
        , view = edocView
        , update = edocUpdate
        }



-- MODEL


type alias EdocModel =
    String



-- UPDATE


type EdocMsg
    = TitleClicked


edocUpdate : EdocMsg -> EdocModel -> EdocModel
edocUpdate msg model =
    model



-- VIEW


edocView : EdocModel -> Html EdocMsg
edocView model =
    h1 [ onClick TitleClicked ] [ text model ]
