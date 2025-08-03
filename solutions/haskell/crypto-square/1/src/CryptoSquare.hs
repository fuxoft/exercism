module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (intercalate)

encode :: String -> String
encode xs = join $ encode' $ split $ cleanUp xs
    where
        cleanUp :: String -> String
        cleanUp str = map toLower $ filter isAlphaNum str
        
        split :: String -> [String]
        split str = split' rowLength str
            where
                rowLength = findRowLength (length str) 1
                    where 
                        findRowLength size row
                          | row * row >= size = row
                          | row * succ row >= size = succ row
                          | otherwise = findRowLength size $ succ row
                split' :: Int -> String -> [String]
                split' _ [] = []
                split' n lst = (takeAndPad n lst) : (split' n (drop n lst))
                    where
                        takeAndPad :: Int -> String -> String
                        takeAndPad n lst = take n ((take n lst) ++ (replicate n ' ')) 

        encode' :: [String] -> [String]
        encode' xss
            | all null xss = []
            | otherwise = (map head xss) : encode' (map tail xss)

        join :: [String] -> String
        join xss = intercalate " " xss