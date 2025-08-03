module Luhn (isValid) where

isValid :: String -> Bool
isValid strNum = (validate . toInt . filt) strNum
    where
        filt :: String -> String
        filt = filter (\ chr -> chr >= '0' && chr <= '9')
        
        toInt :: String -> [Integer]
        toInt = map (\chr -> (read [chr]) :: Integer)

        validate :: [Integer] -> Bool
        validate [] = False
        validate [_] = False
        validate nums = mod (suma (if (even $ length nums) then nums else 0:nums)) 10 == 0
            where
                suma :: [Integer] -> Integer 
                suma nums = sum $ zipWith (\num fun -> fun num) nums $ cycle [(\a -> if a<=4 then 2*a else 2*a-9), id]
