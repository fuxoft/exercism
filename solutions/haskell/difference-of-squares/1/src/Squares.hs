module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference n = ((3*n^2+2*n) * (n^2-1) `div` 12)

squareOfSum :: Integral a => a -> a
squareOfSum n = sum [1..n] ^ 2

sumOfSquares :: Integral a => a -> a
sumOfSquares n = sum $ map (^2) [1..n]
