module Raindrops (convert) where

convert :: Int -> String
convert n =
  let
    str = (ping 3 "Pling") ++ (ping 5 "Plang") ++ (ping 7 "Plong")
  in
    if null str then show n else str
    where
      ping n2 excl = if mod n n2 == 0 then excl else ""
      