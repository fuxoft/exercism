module Grains (square, total) where

square :: Integer -> Maybe Integer
square n =
  if n <= 64 && n >=1
    then Just (2 ^ (n-1))
    else Nothing    

total :: Integer
total = sum $ map (\ i -> just (square i)) [1..64]

just :: Maybe a -> a
just (Just a) = a