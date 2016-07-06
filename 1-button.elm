import Html exposing (Html, button, div, text)
-- import Html.App as Html
import Html.Events exposing (onClick)
import ElmTest exposing (..)

--main =
--  Html.beginnerProgram
--  { model = model
--  , view = view
--  , update = update
--  }


type alias Model = {
  num: Int
  , err: String
}


model : Model
model = {num = 0, err = ""}


type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      if model.num >= 10 then
        { model
        | num = 10
        , err = "TOO HIGH"
        }
      else
        { model
        | num = model.num + 1
        , err = ""
      }
    Decrement ->
      if model.num > 0 then
        { model
        | num = model.num - 1
        , err = ""
        }
      else
        { model
        | num = 0
        , err = "TOO LOW"
        }


view : Model -> Html Msg
view model =
  div []
   [ button [ onClick Decrement] [ text "-" ]
   , div [] [ text (toString model.num) ]
   , div [] [ text (model.err) ]
   , button [ onClick Increment] [ text "+" ]
   ]

-- Tests

tests : Test
tests =
  suite "Our tests"
    [ test "it can inc one" (assertEqual 1 (update Increment model).num ) ]

main : Program Never
main =
    runSuite tests
