module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor =
    let
        num0 = ohms resistor
        (prefix, num) = getPrefix num0 [(1000000000,"giga"),(1000000,"mega"),(1000,"kilo"),(0,"")]
    in
        (show num) ++ " " ++ prefix ++ "ohms"
    where
        getPrefix n ((mult,p):ps) =
            if n >= mult
                then (p, div n (max 1 mult))
                else getPrefix n ps

ohms :: Resistor -> Int
ohms Resistor {bands = (c1,c2,c3)} = (fromEnum c1 * 10 + fromEnum c2) * 10 ^ fromEnum c3 --(max 9 zeroes)