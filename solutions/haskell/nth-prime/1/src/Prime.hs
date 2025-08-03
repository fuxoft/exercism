module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n < 1 = Nothing
    | otherwise = Just $ nthAfter n 1

nthAfter :: Int -> Integer -> Integer
nthAfter 1 num = primeAfter num
nthAfter nth num = nthAfter (pred nth) $ primeAfter num

 -- Next prime higher than num
primeAfter :: Integer -> Integer
primeAfter num =
    if isPrime next
        then next
        else primeAfter next
    where next = succ num

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime 3 = True
isPrime num = not $ elem 0 [mod num x | x <- [2..round $ sqrt $ fromIntegral num]]
