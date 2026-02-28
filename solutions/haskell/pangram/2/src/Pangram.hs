module Pangram (isPangram) where

isPangram :: String -> Bool
isPangram "" = False
isPangram text = all exists ['a'..'z']
  where
    exists chr = contains chr $ stringToLower text
    contains chr [] = False
    contains chr (x:xs) = if chr == x then True else contains chr xs

stringToLower :: String -> String
stringToLower str = map charToLower str
  where
    charToLower :: Char -> Char
    charToLower chr = if chr >= 'A' && chr <= 'Z'
      then ((toEnum ((fromEnum chr) + 32)) :: Char)
      else chr