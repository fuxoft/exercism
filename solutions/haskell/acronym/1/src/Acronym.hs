module Acronym (abbreviate) where
import qualified Data.Char as Ch (toUpper, isUpper, isLower, isSpace)

abbreviate :: String -> String
abbreviate xs =
    let
      filt = filter (\chr -> Ch.isUpper chr || Ch.isLower chr || Ch.isSpace chr || chr == '-') xs
      wrds = words $ zipWith (\chr next -> if (Ch.isLower chr && Ch.isUpper next) || chr == '-' then ' ' else chr) filt (drop 1 filt)
    in
      map (Ch.toUpper . head) wrds
