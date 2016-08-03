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
    svg [ viewBox "0 0 100 100", width "300px" ]
      [ rect [ x "10", y "10", width "50", height "30", fill "#ffff00", stroke "#00ffff" ] []
      , rect [ x "5", y "18", width "20", height "12", fill "#ff00ff" ] []
      , line [ x1 "25", y1 "24", x2 "100", y2 "24", stroke "#023963" ] []
      , circle [cx "100", cy "24", r "10", fill "#ffffff", stroke "#000000" ] []
      ]
