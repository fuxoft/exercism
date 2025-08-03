module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = [row i | i <- [1..x]]

row :: Int -> [Integer]
row 1 = [1]
row r = go (0:row(pred r)++[0])
  where
    go (a:b:rest) = a+b : go(b:rest)
    go _ = []
