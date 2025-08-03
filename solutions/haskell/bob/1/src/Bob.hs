module Bob (responseFor) where

responseFor :: String -> String
responseFor str = (response2 . unwords . words) str

response2 str
    | empty str = "Fine. Be that way!"
    | allCapitals str && lastChar str == '?' = "Calm down, I know what I'm doing!" 
    | allCapitals str = "Whoa, chill out!"
    | lastChar str == '?' = "Sure."
    | otherwise = "Whatever."

allCapitals :: String -> Bool
allCapitals str =
    any (\ chr -> chr >= 'A' && chr <= 'Z') str &&
    (not $ any (\ chr -> chr >= 'a' && chr <= 'z') str)

empty :: String -> Bool
empty str = null $ words str

lastChar :: String -> Char
lastChar str = last str

