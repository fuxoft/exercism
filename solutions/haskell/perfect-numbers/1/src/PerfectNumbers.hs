module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
    | x <= 0 = Nothing
    | x == 1 = Just Deficient
    | aliquotSum x == x = Just Perfect
    | aliquotSum x < x = Just Deficient
    | aliquotSum x > x = Just Abundant

aliquotSum :: Int -> Int
aliquotSum n = sum [i | i <- [1..(div n 2)], mod n i == 0]
