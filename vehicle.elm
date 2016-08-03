import Html exposing (Html)
import Html.App as App
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)



main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Vehicle = (Int,Int)

type alias Model = (Time, List Vehicle)


init : (Model, Cmd Msg)
init =
  ((0, [(0,0)]), Cmd.none)



-- UPDATE


type Msg
  = Tick Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      ((newTime, snd model), Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick



-- VIEW


view : Model -> Html Msg
view model =
  let
    dx x = toString x
    dy y = toString y
  in
    svg [ viewBox "0 0 100 100", width "300px" ]
      [ rect [ x (dx 10), y (dy 10), width "50", height "30", fill "#ffff00", stroke "#00ffff" ] []
      , rect [ x (dx 5), y (dy 18), width "20", height "12", fill "#ff00ff" ] []
      , line [ x1 (dx 25), y1 (dy 24), x2 (dx 100), y2 (dy 24), stroke "#023963" ] []
      , circle [cx (dx 100), cy (dy 24), r "10", fill "#ffffff", stroke "#000000" ] []
      ]
