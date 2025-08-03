module IsbnVerifier (isbn) where

import Data.Char (isDigit, digitToInt)

isbn :: String -> Bool
isbn str =
    let
        noDashes = filter (/='-') str
        numbers = map (charToNum) noDashes
    in
        if length numbers /= 10
          || last numbers > 10
          || any (>9) (take 9 numbers)
          then False
          else check numbers
    where
        check numbers = rem (sum (zipWith (*) numbers [10,9..1])) 11 == 0

charToNum :: Char -> Int
charToNum 'X' = 10
charToNum chr = if isDigit chr then digitToInt chr else 99