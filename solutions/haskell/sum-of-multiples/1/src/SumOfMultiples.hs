module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
    let bigList = concat $ map (\ fact -> if fact == 0 then [] else [fact, (2*fact) .. (pred limit)]) factors
    in sum $ uniques bigList
    where
        uniques :: Eq a => [a] -> [a]
        uniques [] = []
        uniques (x:xs) = if elem x xs
            then uniques xs
            else x:uniques xs 
