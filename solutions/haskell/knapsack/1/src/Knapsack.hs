module Knapsack (maximumValue) where

maximumValue :: Int -> [(Int, Int)] -> Int
maximumValue limit items = foldr ffun 0 $ allCombos items
  where
    ffun combo max = if totValue > max && totWeight <= limit then totValue else max
      where (totWeight, totValue) = foldr (\(x1,y1) (x2,y2) -> (x1+x2,y1+y2)) (0,0) combo

allCombos :: [a] -> [[a]]
allCombos [] = [[]]
allCombos (x:xs) = allCombos xs ++ (map (\l -> x:l) $ allCombos xs)
