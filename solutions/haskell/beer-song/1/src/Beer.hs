module Beer (song) where
import Data.Char (toUpper)
import Data.List (intercalate)

song :: String
song = intercalate "\n" $ map paragraph [99,98..0]
    where
        paragraph num = line1 num ++ line2 num
        line1 num = toUpper x:xs ++ " on the wall, " ++ bobn ++ ".\n"
            where bobn@(x:xs) = bottlesOfBeer num
        line2 num = line2a num ++ bottlesOfBeer (if num==0 then 99 else pred num)
            ++ " on the wall.\n"
        line2a 0 = "Go to the store and buy some more, "
        line2a 1 = "Take it down and pass it around, "
        line2a _ = "Take one down and pass it around, "
        bottlesOfBeer 0 = "no more bottles of beer"
        bottlesOfBeer 1 = "1 bottle of beer"
        bottlesOfBeer n = show n ++ " bottles of beer"
