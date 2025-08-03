module ArmstrongNumbers (armstrong) where

armstrong :: Integral a => a -> Bool
armstrong num0 =
  let 
    digits n
      | n <= 9 = [n]
      | otherwise = (rem n 10) : digits (div n 10)
    digs = digits num0
  in
    num0 == (sum $ map (^(length digs)) digs)
