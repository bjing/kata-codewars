module Codewars.G964.Scalesqstrings where
import Data.List
import Data.List.Split

scale :: String -> Int -> Int -> String
scale strng k n = (scaleVert n . scaleHon k) strng

scaleHon :: Int -> [a] -> [a]
scaleHon = concatMap . replicate

scaleVert :: Int -> String -> String
scaleVert n = intercalate "\n" . filter (/="") . scaleHon n. splitOn "\n"
