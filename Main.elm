module Main exposing (..)

import Html exposing (Html, div, text, h1)
import Html.Events exposing (onClick)
import Keyboard
import Http
import Json.Decode as Decode


main : Program Never EdocModel EdocMsg
main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , view = edocView
        , update = edocUpdate
        , subscriptions = edocSubs
        }



-- MODEL


type alias EdocModel =
    { baseText : String
    , excitementLevel : Int
    }


initialModel : EdocModel
initialModel =
    EdocModel "Hello, Erie Day of Code" 0



-- UPDATE


type EdocMsg
    = TitleClicked
    | KeyPressed Keyboard.KeyCode
    | NewGif (Result Http.Error String)


edocUpdate : EdocMsg -> EdocModel -> ( EdocModel, Cmd EdocMsg )
edocUpdate msg model =
    case msg of
        TitleClicked ->
            ( initialModel, Cmd.none )

        KeyPressed keycode ->
            let
                newModel =
                    if keycode >= 48 && keycode <= 57 then
                        { model | excitementLevel = keycode - 48 }
                    else
                        model
            in
                ( newModel, Cmd.none )

        NewGif (Ok newUrl) ->
            ( { model | gifUrl = Just newUrl }, Cmd.none )

        NewGif (Err _) ->
            ( model, Cmd.none )


getCowGif : Cmd EdocMsg
getCowGif =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=happy+cow&rating=g"

        request =
            Http.get url decodeGifUrl
    in
        Http.send NewGif request


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
    Decode.at [ "data", "image_url" ] Decode.string



-- VIEW


edocView : EdocModel -> Html EdocMsg
edocView model =
    let
        titleText =
            model.baseText
                ++ String.repeat model.excitementLevel "!"
    in
        h1 [ onClick TitleClicked ] [ text titleText ]



-- SUBSCRIPTIONS


edocSubs : EdocModel -> Sub EdocMsg
edocSubs model =
    Keyboard.downs KeyPressed
