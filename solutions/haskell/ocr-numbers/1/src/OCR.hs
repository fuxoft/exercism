module OCR (convert) where

convert :: String -> String
convert x = myConcat $ parseLines $ lines x

myConcat :: [String] -> String
myConcat [str] = str
myConcat (s:ss) = s ++ "," ++ myConcat ss

parseLines :: [String] -> [String]
parseLines [] = []
parseLines (l1:l2:l3:_:xs) = parse3Lines (l1, l2, l3) : parseLines xs

parse3Lines :: (String, String, String) -> String
parse3Lines (l1, l2, l3) = map parseNumber $ zipWith3 (\a b c -> a+b+c) 
    (parseTextLine l1 parseThird1) (parseTextLine l2 parseThird2) (parseTextLine l3 parseThird3) 
    where
        parseTextLine :: String -> (String -> Int) -> [Int]
        parseTextLine "" parseFun = []
        parseTextLine (x:y:z:xs) parseFun = parseFun (x:y:[z]) : parseTextLine xs parseFun
        parseNumber :: Int -> Char
        parseNumber 111 = '0'
        parseNumber 9 = '1'
        parseNumber 94 = '2'
        parseNumber 91 = '3'
        parseNumber 57 = '4'
        parseNumber 115 = '5'
        parseNumber 119 = '6'
        parseNumber 73 = '7'
        parseNumber 127 = '8'
        parseNumber 123 = '9'
        parseNumber _ = '?'

parseThird1 :: String -> Int
parseThird1 " _ " = 64
parseThird1 _ = 0

parseThird2 :: String -> Int
parseThird2 [a,b,c] = (if a == '|' then 32 else 0) + (if b == '_' then 16 else 0) + (if c=='|' then 8 else 0)

parseThird3 :: String -> Int
parseThird3 [a,b,c] = (if a == '|' then 4 else 0) + (if b == '_' then 2 else 0) + (if c=='|' then 1 else 0)