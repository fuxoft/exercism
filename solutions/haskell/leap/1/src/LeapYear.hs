module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = (divisibleBy 400 year) || ((divisibleBy 4 year) && not (divisibleBy 100 year))
  where
    divisibleBy x y = (mod y x) == 0
    