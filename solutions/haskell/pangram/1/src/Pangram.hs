module Pangram (isPangram) where

isPangram :: String -> Bool
isPangram "" = False
isPangram text = all exists ['a'..'z']
  where
    exists chr = contains chr text || contains ((toEnum ((fromEnum chr) - 32)) :: Char) text
    contains chr [] = False
    contains chr (x:xs) = if chr == x then True else contains chr xs
