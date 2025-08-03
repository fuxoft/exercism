module Anagram (anagramsFor) where
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss =
    filter (\ wrd -> toLowerStr wrd /= toLowerStr xs && isAnagram wrd xs) xss

sort :: String -> String
sort [] = []
sort (x:xs) = sort (filter (<x) xs) ++ [x] ++ sort (filter (>=x) xs)

isAnagram :: String -> String -> Bool
isAnagram x y = (sort $ toLowerStr x) == (sort $ toLowerStr y)

toLowerStr :: String -> String
toLowerStr = map toLower