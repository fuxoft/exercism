module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)
import Data.Maybe

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  let converted = map findNucl xs
  in
    if any isNothing converted then Left "Error!"
    else Right $ foldr foldFun (Data.Map.fromList [(A,0),(C,0),(G,0),(T,0)]) converted
    where
        foldFun (Just nuc) acc = Data.Map.adjust succ nuc acc

findNucl :: Char -> Maybe Nucleotide
findNucl 'A' = Just A
findNucl 'C' = Just C
findNucl 'G' = Just G
findNucl 'T' = Just T
findNucl _ = Nothing
