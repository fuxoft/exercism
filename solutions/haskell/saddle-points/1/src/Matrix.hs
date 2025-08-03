module Matrix (saddlePoints) where

import Data.Array

saddlePoints matrix = itemsInBoth (biggestInRows matrix) (smallestInColumns matrix)

itemsInBoth _ [] = [] --aka `intersect`
itemsInBoth [] _ = []
itemsInBoth (x:xs) lst2 = if elem x lst2 then x:(itemsInBoth xs lst2) else itemsInBoth xs lst2

biggestInRows matrix = pickEm (>) $ enumRows matrix

smallestInColumns matrix = pickEm (<) $ enumColumns matrix

pickEm compOp lists = concat $ map (findMinmaxIn compOp) lists
    where
        findMinmaxIn compOp lst =
            let 
                minmax = snd $ foldr1
                  (\i1@(_, val1) i2@(_,val2) -> if (compOp val1 val2) then i1 else i2) lst
                picked = filter (\(_, val) -> val == minmax) lst
            in
                map (\(ind,_) -> ind) picked


enumRows matrix = [enumRow r | r <- [1..height matrix]]
    where
        enumRow r = [((r,i), matrix ! (r,i)) | i <- [1..width matrix]]

enumColumns matrix = [enumColumn c | c <- [1..width matrix]]
    where
        enumColumn c = [((i,c), matrix ! (i,c)) | i <- [1..height matrix]]

height ar = fst (snd (bounds ar))

width ar = snd (snd (bounds ar))
