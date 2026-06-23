module Counting (
    Color(..),
    territories,
    territoryFor
) where

import Data.Set (Set, fromList)

data Color = Black | White deriving (Eq, Ord, Show)
type Coord = (Int, Int)
type Space = (Coord, Maybe Color)

territories :: [String] -> [(Set Coord, Maybe Color)]
territories board = exploreAllAreas (toSpaceList board) []
    where
        exploreAllAreas :: [Space] -> [(Set Coord, Maybe Color)] -> [(Set Coord, Maybe Color)]
        exploreAllAreas board areas = case findEmpty board of
            Nothing -> areas
            (Just (xy,_)) -> exploreAllAreas board2 (area:areas)
                where
                    (area, board2) = exploreAreaAt board xy
        

territoryFor :: [String] -> Coord -> Maybe (Set Coord, Maybe Color)
territoryFor board0 xy = tf found
    where
        board = toSpaceList board0
        found = findXY xy board                
        tf Nothing = Nothing
        tf (Just (_, Just _)) = Nothing
        tf (Just _) = Just $ fst $ exploreAreaAt board xy

exploreAreaAt :: [Space] -> Coord -> ((Set Coord, Maybe Color), [Space])
exploreAreaAt spaces xy0 = makeResult $ iterate xy0 spaces [] (False, Nothing)
    where
        makeResult :: ([Space], [Coord], (Bool, Maybe Color)) -> ((Set Coord, Maybe Color), [Space])
        makeResult (boardRemain, xys, (_, maybeCol)) = ((fromList xys, maybeCol), boardRemain)  
        iterate :: Coord -> [Space] -> [Coord] -> (Bool, Maybe Color) -> ([Space], [Coord], (Bool, Maybe Color))
        iterate xy boardRemain xys colorState = 
            if exists found
                then if (isEmpty found)
                    then doNeighbors [(0,1),(0,-1),(1,0),(-1,0)] xy (newBoardRemain, newXYs, colorState)
                    else (boardRemain, xys, newColorState colorState (colorOf found))
                else (boardRemain, xys, colorState)
            where
                found = findXY xy boardRemain
                foundYes (Just f) = f
                exists Nothing = False
                exists _ = True
                isEmpty (Just (_, Nothing)) = True
                isEmpty _ = False
                (newBoardRemain, newXYs) = moveFromTo (foundYes found) boardRemain xys
                colorOf (Just (_, col)) = col
                doNeighbors :: [Coord] -> Coord -> ([Space], [Coord], (Bool, Maybe Color)) -> ([Space], [Coord], (Bool, Maybe Color))
                doNeighbors [] _ state = state
                doNeighbors ((dx,dy):offsets) (x,y) (s1,s2,s3) = doNeighbors offsets xy (iterate (x+dx,y+dy) s1 s2 s3)

newColorState :: (Bool, Maybe Color) -> Maybe Color -> (Bool, Maybe Color)
newColorState (flag, state) Nothing = (flag, state)
newColorState (False, _) (Just clr) = (True, Just clr)
newColorState (True, Nothing) _ = (True, Nothing)
newColorState (True, Just clr1) (Just clr2) = if clr1 == clr2 then (True, Just clr2) else (True, Nothing)

charToMaybeColor :: Char -> Maybe Color
charToMaybeColor 'B' = Just Black
charToMaybeColor 'W' = Just White
charToMaybeColor _ = Nothing

moveFromTo :: Space -> [Space] -> [Coord] -> ([Space],[Coord])
moveFromTo item@(xy,_) from to = (remove item from, xy:to)
    where
        remove :: Eq a => a -> [a] -> [a]
        remove x (fst:rest)
            | fst == x = rest
            | otherwise = fst:(remove x rest)


findEmpty :: [Space] -> Maybe Space
findEmpty [] = Nothing
findEmpty (fst@(xy, Nothing):rest) = Just fst
findEmpty (fst:rest) = findEmpty rest

findXY :: Coord -> [Space] -> Maybe Space
findXY _ [] = Nothing
findXY xy (fst@(xy2, _):rest)
    | xy2 == xy = Just fst
    | otherwise = findXY xy rest

toSpaceList :: [[Char]] -> [Space]
toSpaceList from = tsl from 1 1
    where
        tsl :: [[Char]] -> Int -> Int -> [Space]
        tsl ([]:restLines) x y = if (null restLines) then [] else tsl restLines 1 (succ y)
        tsl ((ch:restLine):restLines) x y = ((x,y), charToMaybeColor ch) : tsl (restLine:restLines) (succ x) y
