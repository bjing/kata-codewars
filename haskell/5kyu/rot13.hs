module Rot13 where
import Data.Char

rot13 :: String -> String
rot13 = map rot13'

rot13' :: Char -> Char
rot13' c
  | isAlpha c = add13 c
  | otherwise = c

add13 :: Char -> Char
add13 c
  | isLower c && ord c + 13 > ord 'z' = chr $ ord 'a' + 13 - (ord 'z' - ord c + 1)
  | isUpper c && ord c + 13 > ord 'Z' = chr $ ord 'A' + 13 - (ord 'Z' - ord c + 1)
  | otherwise = (chr . (+13) . ord) c


--a b c d e f g h i j k l m
--n o p q r s t u v w x y z


> intersperse ',' "Tq\232(\DLE"
"T,q,\232,(,\DLE"
