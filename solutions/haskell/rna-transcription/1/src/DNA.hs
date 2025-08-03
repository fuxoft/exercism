module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = 
  let converted = map convert xs
  in
    case find findError converted of
      Just (Left bad) -> Left bad
      Nothing -> Right $ map (\ (Right ch) -> ch) converted
    where findError (Left x) = True
          findError _ = False

convert :: Char -> Either Char Char
convert 'C' = Right 'G'
convert 'G' = Right 'C'
convert 'T' = Right 'A'
convert 'A' = Right 'U'
convert chr = Left chr

-- Let's define our own 'find'
find :: (a -> Bool) -> [a] -> Maybe a
find _ [] = Nothing
find fu (x:xs) =
  if fu x
    then Just x
    else find fu xs
