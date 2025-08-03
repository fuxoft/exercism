module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = pick (not . p) xs

keep :: (a -> Bool) -> [a] -> [a]
keep p xs = pick p xs

pick :: (a -> Bool) -> [a] -> [a]
pick _ [] = []
pick p (x:xs) =
    if p x
        then x : (pick p xs)
        else (pick p xs)
