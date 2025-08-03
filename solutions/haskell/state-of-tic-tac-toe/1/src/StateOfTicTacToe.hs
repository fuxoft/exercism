module StateOfTicTacToe (gameState, GameState(..)) where

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState board =
  let
    xs = countAll board 'X'
    os = countAll board 'O'
    winX = winner board 'X'
    winO = winner board 'O'
  in getState xs os winX winO

getState xs os winX winO
  | os > xs || xs > os + 1 = Impossible
  | winX && winO = Impossible
  | winX = WinX
  | winO = WinO
  | xs + os == 9 = Draw
  | otherwise = Ongoing

countAll :: [String] -> Char -> Int
countAll board chr = foldr (\ i sum -> if (peek board i == chr) then succ sum else sum) 0 [0..8]

peek :: [String] -> Int -> Char
peek board n = (board !! (n `div` 3)) !! (n `mod` 3)

winner :: [String] -> Char -> Bool
winner board chr = any mfun linesABC
  where
    mfun abc = all (\i -> peek board i == chr) abc

linesABC = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]