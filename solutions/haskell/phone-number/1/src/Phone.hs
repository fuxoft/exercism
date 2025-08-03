module Phone (number) where
import Data.Char (isDigit)

number :: String -> Maybe String
number xs = checkNumOfDigits (toDigits xs) >>= checkNumbers
  where
    toDigits :: String -> String
    toDigits str = filter (isDigit) str

    checkNumOfDigits :: String -> Maybe String
    checkNumOfDigits [] = Nothing
    checkNumOfDigits str@(x:xs)
        | x == '1' = checkNumOfDigits xs
        | length str == 10 = Just str
        | otherwise = Nothing

    checkNumbers str =
        if head str > '1' && str !! 3 > '1'
            then Just str
            else Nothing
