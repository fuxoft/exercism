module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black =
  let
    board = replicate 8 "_ _ _ _ _ _ _ _"
  in
    unlines $ maybeAdd white 'W' $ maybeAdd black 'B' board
      where
        maybeAdd Nothing _ board = board
        maybeAdd (Just (x,y)) piece board = boardPoke board x (y*2) piece

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1,y1) (x2,y2) =
  let
    d1 = abs (x1-x2)
    d2 = abs (y1-y2)
  in
    d1==0 || d2==0 || d1==d2

boardPoke :: [String] -> Int -> Int -> Char -> [String]
boardPoke brd x y wot = replaceWith brd x (replaceWith (brd !! x) y wot)

replaceWith :: [a] -> Int -> a -> [a]
replaceWith lst ind wot = before ++ (wot : after)
    where
        (before, after') = splitAt ind lst
        after = tail after'
