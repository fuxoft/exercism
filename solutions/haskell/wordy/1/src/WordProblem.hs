module WordProblem (answer) where

answer :: String -> Maybe Integer
answer "" = Nothing
answer problem = if last problem == '?' then answer' (words (init problem)) else Nothing

answer' :: [String] -> Maybe Integer
answer' ("What" : "is" : rest) = parse $ convert rest
answer' _ = Nothing

data Token = Number Integer | Operator (Integer->Integer->Integer) String | Text String
instance Show Token where
    show (Operator _ name) = "Op " ++ name
    show (Number n) = "Num " ++ show n
    show (Text str) = "\"" ++ str ++ "\""

convert :: [String] -> [Token]
convert x = ops $ map mfun x
  where
    mfun elem =
      if all (\x -> (x>='0' && x<='9') || x=='-') elem -- This is ugly
      then Number (read elem)
      else Text elem

ops :: [Token] -> [Token]
ops [] = []
ops (Text "plus" : rest) = Operator (+) "+": ops rest
ops (Text "minus" : rest) = Operator (-) "-": ops rest
ops (Text "multiplied" : Text "by" : rest) = Operator (*) "*": ops rest
ops (Text "divided" : Text "by" : rest) = Operator div "/" : ops rest
ops (x:rest) = x : ops rest

parse :: [Token] -> Maybe Integer
parse [Number n] = Just n
parse (Number n1 : Operator op _ : Number n2 : rest) = parse $ Number (op n1 n2) : rest
parse _ = Nothing