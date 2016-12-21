module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Person =
  { name : String
  , avatar : String
  , location : String
  , role : String
  }


type alias Model =
  List Person


init : ( Model, Cmd Msg )
init =
  ( []
  , getPeople
  )



-- UPDATE


type Msg
  = NewPeople (Result Http.Error Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NewPeople (Ok newPeople) ->
      ( newPeople, Cmd.none )

    NewPeople (Err _) ->
      ( model, Cmd.none )



-- VIEW


viewPerson : Person -> Html Msg
viewPerson p =
  div [ class "card" ]
    [ img
      [ src p.avatar
      , alt "user-avatar"
      ] []
    , div [ class "card-content" ]
      [ Html.p []
        [ span [ class "strong" ] [ text "Name: " ]
        , text p.name
        ]
      , Html.p []
        [ span [ class "strong" ] [ text "Location: " ]
        , text p.location
        ]
      , Html.p []
        [ span [ class "strong" ] [ text "Role: " ]
        , text p.role
        ]
      ]
    ]


view : Model -> Html Msg
view model =
  div [ class "container" ] (List.map viewPerson model)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- HTTP


getPeople : Cmd Msg
getPeople =
  Http.send NewPeople (Http.get "/api/person" dataDecoder)



personDecoder : Decode.Decoder Person
personDecoder =
  Decode.map4 Person (Decode.field "name" Decode.string) (Decode.field "avatar" Decode.string) (Decode.field "location" Decode.string) (Decode.field "role" Decode.string)


dataDecoder : Decode.Decoder Model
dataDecoder =
  Decode.at [ "data" ] (Decode.list personDecoder)
