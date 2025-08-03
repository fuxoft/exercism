module Minesweeper (annotate) where

import Data.List (intercalate)

annotate :: [String] -> [String]
annotate board = boardContents (minesweep (makeBoard board))

minesweep :: Board -> Board
minesweep board =
    let
        allCrds = allCoords (1,1) ((boardHeight board),(boardWidth board))
    in foldr foldfun board allCrds
    where
        foldfun (x,y) prevBrd =
            if boardPeek prevBrd x y == '*'
                then prevBrd
                else 
                    if nNeighbrs > 0
                        then boardPoke prevBrd x y $ head $ show nNeighbrs
                        else prevBrd
                    where
                        nNeighbrs = length $ filterMap (=='*') (\(xx,yy)->boardPeek prevBrd xx yy) nineCellsXY
                        nineCellsXY = map (addPairs (x,y)) (allCoords ((-1),(-1)) (1,1))

brd = makeBoard ["*    ","**   ","  *  ", "   **", " ****"]
res = minesweep brd

-- ' ' = Empty cell
data Board = Board { boardWidth :: Int
                     , boardHeight :: Int
                     , boardContents :: [String]
                     }

instance Show Board where
    show Board {boardContents = lines, boardHeight = h, boardWidth = w} = intercalate "\n" (header:lines)
        where header = "<Board " ++ show h ++ "x" ++ show w ++ ">"

makeBoard :: [String] -> Board
makeBoard strings =
    Board {boardContents = strings, boardHeight = length strings, boardWidth = length $ head strings}

boardPeek :: Board -> Int -> Int -> Char
boardPeek brd x y = if x<1 || x>h || y<1 || y>w
    then ' '
    else (boardContents brd) !! (pred x) !! (pred y)
        where
            w = boardWidth brd
            h = boardHeight brd

boardPoke :: Board -> Int -> Int -> Char -> Board
boardPoke brd x y wot = brd {boardContents = replaceWith cont x (replaceWith (cont !! (pred x)) y wot)}
    where cont = boardContents brd

replaceWith :: [a] -> Int -> a -> [a]
replaceWith lst ind wot = before ++ (wot : after)
    where
        (before, after') = splitAt (pred ind) lst
        after = tail after'

allCoords :: (Int, Int) -> (Int, Int) -> [(Int, Int)]
allCoords (x1,y1) (x2,y2) = [(i,j) | i <- [x1..x2], j <- [y1..y2]]

addPairs :: (Int, Int) -> (Int, Int) -> (Int, Int)
addPairs (x1,y1) (x2,y2) = (x1+x2,y1+y2)

filterMap :: (a->Bool) -> (b->a) -> [b] -> [a]
filterMap ffun mapfun wot = filter ffun $ map mapfun wot