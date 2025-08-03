module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot {robotCoords :: (Integer, Integer), robotBearing :: Bearing} deriving (Show)

bearing :: Robot -> Bearing
bearing robot = robotBearing robot

coordinates :: Robot -> (Integer, Integer)
coordinates robot = robotCoords robot

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates = Robot {robotCoords = coordinates, robotBearing = direction}

move :: Robot -> String -> Robot
move robot instructions = foldl moveStep robot instructions

moveStep :: Robot -> Char -> Robot
moveStep rob0 'L' = turnLeft rob0
moveStep rob0 'R' = (turnLeft . turnLeft . turnLeft) rob0
moveStep rob0 'A' = advance rob0

turnLeft :: Robot -> Robot
turnLeft rob0@Robot{robotBearing = bear} = rob0{robotBearing = actualTurn bear}
    where
        actualTurn North = West
        actualTurn West = South
        actualTurn South = East
        actualTurn East = North

advance :: Robot -> Robot
advance rob0@Robot{robotBearing=bear, robotCoords=coor} = rob0 {robotCoords=addMove coor bear}
    where
        addMove :: (Integer, Integer) -> Bearing -> (Integer, Integer)
        addMove coor bear = addPairs coor (delta bear)
        delta East = (1,0)
        delta West = ((-1),0)
        delta North = (0,1)
        delta South = (0,(-1))

addPairs :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
addPairs (x1,y1) (x2, y2) = (x1+x2, y1+y2)

{--

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

turn right
turn left
advance
Robots are placed on a hypothetical infinite grid, facing a particular direction (north, east, south, or west) at a set of {x,y} coordinates, e.g., {3,8}, with coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the testing facility verifies the robot's new position, and in which direction it is pointing.

The letter-string "RAALAL" means:
Turn right
Advance twice
Turn left
Advance once
Turn left yet again
Say a robot starts at {7, 3} facing north. Then running this stream of instructions should leave it at {9, 4} facing west.
To complete this exercise, you need to create the data type Robot, and implement the following functions:

bearing
coordinates
mkRobot
move
You will find a dummy data declaration and type signatures already in place, but it is up to you to define the functions and create a meaningful data type, newtype or type synonym.

--}