module Main exposing (..)

import Html exposing (Html, div, text, h1)


main : Html msg
main =
    h1 [] [ text "Hello, World!" ]



-- MODEL


type alias EdocModel =
    String



-- UPDATE
--type Msg = Reset | ...
--update : Msg -> Model -> Model
--update msg model =
--  case msg of
--    Reset -> ...
--    ...
--
--
-- VIEW
--view : Model -> Html Msg
--view model =
--  ...
