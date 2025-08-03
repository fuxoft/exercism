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
        takenNum = takeWhile isNumber str
        rest0 = drop (length takenNum) str
        chr = head rest0
        rest = tail rest0
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
        taken = takeWhile (== head str) str
        rest = drop (length taken) str
    in
        (encode1 taken, rest)

encode1 :: String -> String
encode1 [chr] = [chr]
encode1 str = show(length str) ++ [head str]
