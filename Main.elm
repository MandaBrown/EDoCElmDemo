module Main exposing (..)

import Html exposing (h1, text)
import Html.Events exposing (onClick)
import Keyboard


main : Program Never EdocModel EdocMsg
main =
    Html.program
        { init = ( edocDemoModel, Cmd.none )
        , subscriptions = edocDemoSubscription
        , update = edocDemoUpdate
        , view = edocDemoView
        }



-- MODEL


type alias EdocModel =
    { baseText : String
    , excitementLevel : Int
    }


edocDemoModel : EdocModel
edocDemoModel =
    EdocModel "Hello, Erie Day ofEd Code!" 0



-- VIEW


edocDemoView : EdocModel -> Html.Html EdocMsg
edocDemoView model =
    let
        titleText =
            model.baseText
                ++ String.repeat model.excitementLevel "!"
    in
        h1 [ onClick TitleClick ] [ text titleText ]



-- UPDATE


type EdocMsg
    = TitleClick
    | KeyDown Keyboard.KeyCode


edocDemoUpdate : EdocMsg -> EdocModel -> ( EdocModel, Cmd EdocMsg )
edocDemoUpdate msg model =
    case msg of
        TitleClick ->
            let
                newModel =
                    { model | excitementLevel = model.excitementLevel + 1 }
            in
                ( newModel, Cmd.none )



-- SUBSCRIPTIONS


edocDemoSubscription : EdocModel -> Sub EdocMsg
edocDemoSubscription _ =
    Keyboard.downs KeyDown
