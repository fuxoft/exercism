module ProteinTranslation(proteins) where

proteins :: String -> Maybe [String]
proteins str = Just $ map whatCodon $ takeWhile noStop (triplets str)

triplets :: String -> [String]
triplets "" = []
triplets (c1:c2:c3:cs) = [c1,c2,c3] : triplets cs

whatCodon :: String -> String
whatCodon "AUG" = "Methionine"
whatCodon "UUU" = "Phenylalanine"
whatCodon "UUC" = "Phenylalanine"
whatCodon "UGG" = "Tryptophan"
whatCodon ['U','U',_] = "Leucine"
whatCodon ['U','C',_] = "Serine"
whatCodon ['U','A',_] = "Tyrosine"
whatCodon ['U','G',_] = "Cysteine"

noStop :: String -> Bool
noStop "UAA" = False
noStop "UAG" = False
noStop "UGA" = False
noStop _ = True