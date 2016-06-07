module Codewars.Kirilloid.MultilinearPolynomials where
import Data.List
import Data.List.Split

simplify :: String -> String
simplify = reduceIt . splitIt

splitIt :: String -> [String]
splitIt = split (keepDelimsL $ oneOf "+-")

--dedupIt :: [String] -> [String]

-- TODO need to group different elements
-- within a group, do the following:
-- takeWhile (not . isAlpha) "+2abc"

reduceIt :: [String] -> String
reduceIt = (foldl (++) "") . (map sort)
