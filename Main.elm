module Main exposing (..)

import Html exposing (Html, div, text, h1)


main : Html msg
main =
    h1 [] [ text "Hello, World!" ]



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
    h1 [] [ text model ]
