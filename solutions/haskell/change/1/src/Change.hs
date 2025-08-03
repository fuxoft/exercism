module Change (findFewestCoins) where

import qualified Data.Map as Map (empty, lookup, insert, alter)
import Data.List (sort)

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins 0 _ = Just []
findFewestCoins val coins0 =
    let
        onePass coin map0 = foldl oneVal map0 [1..val]
            where
                oneVal mp indx =
                    if indx == coin
                        then Map.insert indx [coin] mp
                        else Map.alter alterFun indx mp
                            where
                                alterFun = (\item -> better item ((Map.lookup (indx-coin) mp) >>= (\xx -> Just (coin:xx))))
                                    where
                                        better a b = if (maybe maxBound length a) < (maybe maxBound length b) then a else b
        finalMap = foldr onePass Map.empty (sort coins0)
    in
        Map.lookup val finalMap >>= (Just . sort)
