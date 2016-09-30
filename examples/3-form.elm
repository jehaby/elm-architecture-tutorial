import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (length)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , age : String
  }


model : Model
model =
  Model "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Age String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
        { model | name = name }

    Password password ->
        { model | password = password }
          
    PasswordAgain password ->
        { model | passwordAgain = password }

    Age age ->
        { model | age = age }
          


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ inp "Name" Name
    , inp "Password" Password
    , inp "Re-enter Password" PasswordAgain
    , inp "Age" Age
    , viewValidation model
    , button [] [ text "Ok" ]
    ]


inp txt msg =
    input [ type' "text", placeholder txt, onInput msg] []


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password /= model.passwordAgain then
        ("red", "Passwords do not match!")          
      else if (length model.password) < 5 then
          ("red", "Password is too short")
      else
        ("green", "OK")
  in
    div [ style [("color", color)] ] [ text message ]
