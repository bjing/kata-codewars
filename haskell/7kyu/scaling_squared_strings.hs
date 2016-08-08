module Codewars.G964.Scalesqstrings where
import Data.List
import Data.List.Split

scale :: [Char] -> Int -> Int -> [Char]
scale strng k n = (postProc . scaleVert n . scaleHon k) strng

scaleHon n = concatMap (take n . repeat)

scaleVert n = scaleHon n . splitOn "\n"

postProc = intercalate "\n" . filter (/="")
