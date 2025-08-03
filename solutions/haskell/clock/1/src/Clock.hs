module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving (Eq)

instance (Show Clock) where
    show (Clock hh mm) = (int2str hh) ++ ":" ++ (int2str mm)
        where
            int2str :: Int -> String
            int2str n = (if n < 10 then "0" else "") ++ show n

fromHourMin :: Int -> Int -> Clock
fromHourMin hh mm = normalize $ Clock hh mm

toString :: Clock -> String
toString clock = show clock

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock h2 m2) = fromHourMin (h + h2) (m + m2)

normalize :: Clock -> Clock
normalize (Clock hh mm) =
    let mins = 60 * hh + mm
    in Clock (mod (div mins 60) 24) (mod mins 60)
