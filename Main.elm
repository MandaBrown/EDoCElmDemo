module Main exposing (..)

import Html exposing (h1, text)


main : Html.Html msg
main =
    edocDemoView edocDemoModel



-- MODEL


edocDemoModel : String
edocDemoModel =
    "Hello, Erie Day of Code!"



-- VIEW


edocDemoView : String -> Html.Html msg
edocDemoView model =
    h1 [] [ text model ]
