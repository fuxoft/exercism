module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List (partition)

wordCount :: String -> [(String, Int)]
wordCount str = count $ map unquote $ scanWords str
  where
    unquote wrd = if head wrd == '\'' && last wrd == '\''
      then tail $ reverse $ tail $ reverse wrd
      else wrd

scanWords :: String -> [String]
scanWords str = 
  let 
    (wrds, wrd) = foldr scanf ([],[]) str
      where
        scanf chr (wrds, wrd) =
          if chr == '\'' || isAlphaNum chr
            then (wrds, (toLower chr : wrd))
            else
              if null wrd
                then (wrds, [])
                else (wrd : wrds, [])
  in
    if null wrd then wrds else wrd:wrds

count :: [String] -> [(String, Int)]
count wrds = count' wrds []
  where
    count' [] dict = dict
    count' wrds@(x:xs) dict = 
      let
        (is, isnt) = partition (==x) xs
      in
        count' isnt ((x, succ $ length is) : dict)
