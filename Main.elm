module Main exposing (..)

import Html exposing (h1, text)


main : Program Never String msg
main =
    Html.program
        { init = ( edocDemoModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = edocDemoUpdate
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



-- UPDATE


edocDemoUpdate : msg -> String -> ( String, Cmd msg )
edocDemoUpdate _ _ =
    ( edocDemoModel, Cmd.none )
