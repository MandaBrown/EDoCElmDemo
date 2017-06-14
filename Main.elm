module Main exposing (..)

import Html exposing (h1, text)


main : Html.Html msg
main =
    Html.program
        { init = ( edocDemoModel, Cmd.none )
        , subscriptions = ()
        , update = ()
        , view = edocDemoView
        }



-- MODEL


edocDemoModel : String
edocDemoModel =
    "Hello, Erie Day of Code!"



-- VIEW


edocDemoView : String -> Html.Html msg
edocDemoView model =
    h1 [] [ text model ]
