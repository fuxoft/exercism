module WordSearch (search, CharPos(..), WordPos(..)) where

import Data.Maybe (fromJust)

data CharPos = CharPos{col::Int, row::Int} deriving (Eq, Show)
data WordPos = WordPos{start::CharPos, end::CharPos} deriving (Eq, Show)
data Grid = Grid {height::Int, width::Int, contents :: [String]} deriving (Show)

search :: [String] -> [String] -> [(String, Maybe WordPos)]
search grid' wordList =
  let
    grid = parseGrid grid'
  in
    map (findWord grid) wordList

findWord :: Grid -> String -> (String, Maybe WordPos)
findWord grid wrd = findWord' $ allCoords grid
  where
    findWord' :: [CharPos] -> (String, Maybe WordPos)
    findWord' [] = (wrd, Nothing)
    findWord' (xy:xys) = if findWordAt allDirections == Nothing then findWord' xys else (wrd, findWordAt allDirections)
      where
        findWordAt :: [CharPos] -> Maybe WordPos
        findWordAt [] = Nothing
        findWordAt (dxy:rest) = if findWordDirResult == Nothing then findWordAt rest
            else Just $ WordPos {start = xy, end = fromJust findWordDirResult}
          where
            findWordDirResult = findWordDir wrd xy
            findWordDir :: String -> CharPos -> Maybe CharPos --Returns XY of the last letter
            findWordDir [] charXY = Just $ doCPs (-) charXY dxy
            findWordDir (chr:chrs) charXY = if peekGrid grid charXY == chr then findWordDir chrs (doCPs (+) dxy charXY) 
              else Nothing

parseGrid :: [String] -> Grid
parseGrid strs = Grid {contents = strs, height = length strs, width = length $ head strs}

peekGrid :: Grid -> CharPos -> Char
peekGrid grid crds = if isInside grid crds then doPeek else '?'
  where
    doPeek = (contents grid !! pred (row crds)) !! pred (col crds)

doCPs :: (Int->Int->Int) -> CharPos -> CharPos -> CharPos
doCPs fun cp1 cp2 = CharPos {row = row cp1 `fun` (row cp2), col = col cp1 `fun` (col cp2)}

allCoords :: Grid -> [CharPos]
allCoords grid = [CharPos {row = r, col = c} | r <- [1..height grid], c <- [1..width grid]]

allDirections :: [CharPos]
allDirections = [CharPos {row = r, col = c} | r <- [(-1)..1], c <- [(-1)..1], c /= 0 || r /= 0 ]

isInside :: Grid -> CharPos -> Bool
isInside grid crds = row crds >= 1 && col crds >= 1 && row crds <= height grid && col crds <= width grid
