module TwelveDays (recite) where

import Data.List (intercalate)

recite :: Int -> Int -> [String]
recite start stop = map line [start..stop]

line :: Int -> String
line n = "On the " ++ nth ++ " day of Christmas my true love gave to me: " ++ gifts ++ "."
  where
    nth = daysTxt !! pred n
    gifts1 = take n giftsTxt
    gifts2 = (if n == 1 then head gifts1 else "and " ++ head gifts1) : tail gifts1
    gifts = intercalate ", " (reverse gifts2)

daysTxt :: [String]
daysTxt = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

giftsTxt :: [String]
giftsTxt = ["a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings",
  "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping",
  "eleven Pipers Piping", "twelve Drummers Drumming"]