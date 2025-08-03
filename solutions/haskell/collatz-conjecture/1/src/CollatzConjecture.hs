module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n > 0 = Just $ collatz' 0 n
  | otherwise = Nothing
  where
    collatz' :: Integer -> Integer -> Integer
    collatz' sol 1 = sol
    collatz' sol n =
      collatz' (succ sol) (if even n
        then div n 2
        else 3 * n + 1)

