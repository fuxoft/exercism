module SecretHandshake (handshake) where
import Data.Bits ((.&.))

handshake :: Int -> [String]
handshake num = 
  let 
    bit x = (num .&. (2^x)) /= 0
    res0 = (if bit 0 then ["wink"] else [])
      ++ (if bit 1 then ["double blink"] else [])
      ++ (if bit 2 then ["close your eyes"] else [])
      ++ (if bit 3 then ["jump"] else [])
  in if bit 4 then reverse res0 else res0  
