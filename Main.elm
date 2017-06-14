module Main exposing (..)

import Html exposing (h1, text)


main : Html.Html msg
main =
    h1 [] [ text edocDemoModel ]



-- MODEL


edocDemoModel : String
edocDemoModel =
    "Hello, Erie Day of Code!"
