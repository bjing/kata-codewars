module Codewars.G964.Scalesqstrings where
import Data.List
import Data.List.Split

scale :: [Char] -> Int -> Int -> [Char]
scale strng k n = (scaleVert n . scaleHon k) strng

scaleHon n = concatMap (take n . repeat)

scaleVert n = intercalate "\n" . filter (/="") . scaleHon n . splitOn "\n"
