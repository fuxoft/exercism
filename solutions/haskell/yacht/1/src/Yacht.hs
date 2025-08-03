module Yacht (yacht, Category(..)) where

import Data.List (sort, sortBy)

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

nums num dice = num * countElem num dice
histo dice = sortBy (flip compare) $ map (\i -> countElem i dice) [1..6]
countElem num dice = length $ filter (==num) dice

yacht :: Category -> [Int] -> Int
yacht Ones dice = nums 1 dice
yacht Twos dice = nums 2 dice
yacht Threes dice = nums 3 dice
yacht Fours dice = nums 4 dice
yacht Fives dice = nums 5 dice
yacht Sixes dice = nums 6 dice
yacht FullHouse dice = if take 2 (histo dice) == [3,2] then sum dice else 0
yacht FourOfAKind dice = if head (histo dice) >= 4 then
    if head sorted == sorted !! 2
      then 4*(head sorted)
      else 4*(last sorted)
  else 0
  where sorted = sort dice
yacht LittleStraight dice = if sort dice == [1,2,3,4,5] then 30 else 0
yacht BigStraight dice = if sort dice == [2,3,4,5,6] then 30 else 0
yacht Choice dice = sum dice
yacht Yacht (d:ds) = if all (==d) ds then 50 else 0

