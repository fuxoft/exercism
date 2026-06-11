module FlowerField (annotate) where

annotate :: [String] -> [String]
annotate board = mapTriplets (zipWith3 zipFun) (repeat "   ") $ map (mapTriplets charFun ' ') board
  where
    charFun :: Char -> Char -> Char -> [Char]
    charFun a b c = [a,b,c]
    zipFun :: [Char] -> [Char] -> [Char] -> Char
    zipFun _ [_,'*',_] _ = '*'
    zipFun [a,b,c] [d,e,f] [g,h,i] = sumToChar $ sum $ map charValue [a,b,c,d,e,f,g,h,i]
    sumToChar :: Int -> Char
    sumToChar 0 = ' '
    sumToChar x = toEnum (x + 48) :: Char

mapTriplets :: (a -> a -> a -> b) -> a -> [a] -> [b]
mapTriplets _ _ [] = []
mapTriplets fun edgeChar lst = map3 $ [edgeChar] ++ lst ++ [edgeChar]
  where
    map3 [x,y,z] = [fun x y z]
    map3 (x:y:z:rest) = (fun x y z) : map3 (y:z:rest)

charValue :: Char -> Int
charValue '*' = 1
charValue _ = 0