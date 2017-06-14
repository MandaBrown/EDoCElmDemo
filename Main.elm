module Main exposing (..)

import Html exposing (h1, text)
import Html.Events exposing (onClick)


main : Program Never String EdocMsg
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


edocDemoView : String -> Html.Html EdocMsg
edocDemoView model =
    h1 [ onClick TitleClick ] [ text model ]



-- UPDATE


type EdocMsg
    = TitleClick


edocDemoUpdate : EdocMsg -> String -> ( String, Cmd EdocMsg )
edocDemoUpdate msg _ =
    ( edocDemoModel, Cmd.none )
