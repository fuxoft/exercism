module GameOfLife (tick) where
tick :: [[Int]] -> [[Int]]
tick prevGen = zipWith (zipWith newGen) prevGen (sums prevGen)
  where
    newGen :: Int -> Int -> Int
    newGen _ 3 = 1
    newGen 1 4 = 1
    newGen _ _ = 0
sums :: [[Int]] -> [[Int]]
sums board = 
  tripleMap (zipWith3 sum3) (repeat 0) (map (tripleMap sum3 0) board)
  where
    sum3 a b c = a+b+c
tripleMap :: (a->a->a->b) -> a -> [a] -> [b]
tripleMap fun border lst = go $ border : lst
  where
    go (a:b:c:rest) = fun a b c : go (b:c:rest)
    go [a,b] = [fun a b border]
    go _ = []