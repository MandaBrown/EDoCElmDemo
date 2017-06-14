module Main exposing (..)

import Html exposing (h1, text)


main : Html.Html msg
main =
    Html.program
        { init = ( edocDemoModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = \_ _ -> ( edocDemoModel, Cmd.none )
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
