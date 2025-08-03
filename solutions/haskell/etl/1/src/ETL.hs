module ETL (transform) where

import Data.Map (Map, toList, fromList, unions)
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform legacyData = unions $ map oneLine $ toList legacyData

oneLine :: (a, String) -> Map Char a
oneLine (score, upLtrs) = fromList $ map (\char -> (toLower char, score)) upLtrs