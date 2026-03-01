module Grains (square, total) where

square :: Integer -> Maybe Integer
square n =
  if n <= 64 && n >=1
    then Just $ 2 ^ pred n
    else Nothing

total :: Integer
total = 2 ^ 64 - 1
