module RunLength (decode, encode) where

import Data.Char (isNumber)

decode :: String -> String
decode "" = ""
decode str =
    let
        (num, char, rest) = decode1 str
    in
        (replicate num char) ++ decode rest

decode1 :: String -> (Int, Char, String)
decode1 str =
    let
        (takenNum,rest0) = span isNumber str
        chr:rest = rest0
    in
        if takenNum == ""
            then (1, chr, rest)
            else (read takenNum, chr, rest)


encode :: String -> String
encode "" = ""
encode str =
    let
        (encoded, rest) = takeSame str
    in
        encoded ++ encode rest


takeSame :: String -> (String, String)
takeSame str =
    let
        (taken, rest) = span (== head str) str
    in
        (encode1 taken, rest)

encode1 :: String -> String
encode1 [chr] = [chr]
encode1 str = show(length str) ++ [head str]
