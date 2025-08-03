module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = calc xs ys 0
  where
    calc :: String -> String -> Int -> Maybe Int
    calc [] [] n = Just n
    calc (x:xs) (y:ys) n = calc xs ys $ if x==y then n else succ n
    calc _ _ _ = Nothing
