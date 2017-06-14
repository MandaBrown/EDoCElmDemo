module Main exposing (..)

import Html exposing (h1, text, div, img)
import Html.Attributes exposing (src, class)
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
    , gifUrl : Maybe String
    }


edocDemoModel : EdocModel
edocDemoModel =
    EdocModel "Hello, Erie Day of Code!" 0 Nothing



-- VIEW


edocDemoView : EdocModel -> Html.Html EdocMsg
edocDemoView model =
    let
        titleText =
            model.baseText
                ++ String.repeat model.excitementLevel "!"

        gifUrl =
            case model.gifUrl of
                Just url ->
                    url

                Nothing ->
                    "https://media.giphy.com/media/hFmIU5GQF18Aw/giphy.gif"
    in
        div []
            [ h1 [ onClick TitleClick ] [ text titleText ]
            , img [ src gifUrl, class "animated-animal" ] []
            ]



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

        KeyDown keyCode ->
            let
                newLevel =
                    if keyCode >= 48 && keyCode <= 57 then
                        keyCode - 48
                    else
                        1

                newModel =
                    { model | excitementLevel = newLevel }
            in
                ( newModel, Cmd.none )



-- SUBSCRIPTIONS


edocDemoSubscription : EdocModel -> Sub EdocMsg
edocDemoSubscription _ =
    Keyboard.downs KeyDown
