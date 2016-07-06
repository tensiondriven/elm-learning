import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }


type alias Model = {
  num: Int
}


model : Model
model = {num = 0}


type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      if model.num >= 10 then
        { num = 10 }
      else
        { num = model.num + 1 }
    Decrement ->
      if model.num > 0 then
        { num = model.num - 1 }
      else
        { num = 0 }


view : Model -> Html Msg
view model =
  div []
   [ button [ onClick Decrement] [ text "-" ]
   , div [] [ text (toString model.num) ]
   , button [ onClick Increment] [ text "+" ]
   ]

