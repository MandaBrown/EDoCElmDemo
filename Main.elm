module Main exposing (..)

import Html exposing (h1, text, div, img)
import Html.Attributes exposing (src, class)
import Html.Events exposing (onClick)
import Keyboard
import Time exposing (Time, second)
import Http
import Json.Decode as Decode


main : Program Never EdocModel EdocMsg
main =
    Html.program
        { init = ( edocDemoModel, getCowGif )
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
    | ChangeGif
    | NewGif (Result Http.Error String)


edocDemoUpdate : EdocMsg -> EdocModel -> ( EdocModel, Cmd EdocMsg )
edocDemoUpdate msg model =
    case msg of
        ChangeGif ->
            ( model, getCowGif )

        NewGif (Ok newUrl) ->
            ( { model | gifUrl = Just newUrl }, Cmd.none )

        NewGif (Err _) ->
            ( model, Cmd.none )

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



-- SUBSCRIPTIONS


edocDemoSubscription : EdocModel -> Sub EdocMsg
edocDemoSubscription _ =
    Sub.batch
        [ Keyboard.downs KeyDown
        , Time.every (second * 6) (\_ -> ChangeGif)
        ]
