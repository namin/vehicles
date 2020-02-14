-- Use arrow keys to move the turtle around.
--
-- Forward with UP and turn with LEFT and RIGHT.
--
-- Learn more about the playground here:
--   https://package.elm-lang.org/packages/evancz/elm-playground/latest/
--

import Playground exposing (..)


main =
  game view update
    { x = 0
    , y = 0
    , angle = 0
    }


view computer turtle =
  [ rectangle blue computer.screen.width computer.screen.height
  , viewTurtle green turtle.x turtle.y turtle.angle
  , viewTurtle red -turtle.x -turtle.y -turtle.angle
  ]


viewTurtle color x y angle =
  group
    [ circle color 50
        |> move x y
    , image 96 96 "https://elm-lang.org/images/turtle.gif"
        |> move x y
        |> rotate angle
    ]


update computer turtle =
  { x = turtle.x + toY computer.keyboard * cos (degrees turtle.angle)
  , y = turtle.y + toY computer.keyboard * sin (degrees turtle.angle)
  , angle = turtle.angle - toX computer.keyboard
  }
