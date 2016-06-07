module Codewars.Kirilloid.MultilinearPolynomials where
import Data.List
import Data.List.Split
import Data.Char
import GHC.Exts

simplify :: String -> String
-- TODO compose more functions in the pipeline
simplify = reduceIt . transformIt . splitIt

splitIt :: String -> [String]
splitIt = split (keepDelimsL $ oneOf "+-")

reduceIt :: [String] -> String
reduceIt = (foldl (++) "") . (map sort)

--dedupIt :: [String] -> [String]


extractCoeff = takeWhile (not . isAlpha)
extractNumber = dropWhile (not . isAlpha)
normaliseCoeff :: [Char] -> [Char]
normaliseCoeff c
  | c == "-" = "-1"
  | c == "+" = "1"
  | isPrefixOf "+" c && length c > 1 = drop 1 c
  | otherwise = c
separateCoefficients s = ((normaliseCoeff . extractCoeff) s, extractNumber s)


intToString :: Int -> String
intToString i = show i
stringToInt :: String -> Int
stringToInt s = read s :: Int

transformIt = normaliseAll . sumCoeffs . separateAllCoeffs
separateAllCoeffs = (map unzip . groupWith (\(c, n) -> n)) . (map separateCoefficients)
sumCoeffs = map (\(c, n) -> (sum(map stringToInt c), (head n)))
normaliseAll = map (\(i, n) -> normalise (intToString i ++ n))
normalise s
  | isPrefixOf "-1" s = "-" ++ (drop 2 s)
  | isPrefixOf "1" s = "+" ++ (tail s)
  | otherwise = s

-- Notes
-- splitRes = ["+2abc", "-bc", "-abc"]
-- separateRes = map separateCoefficients splitRes
-- res1 = (map unzip . groupWith (\(c, n) -> n)) separateRes
-- res2 = map (\(c, n) -> (sum(map stringToInt c), (head n))) res1
-- res 3 = map (\(i, n) -> normalise (intToString i ++ n)) res2

-- ["+2abc", "-bc", "-abc"]
-- foldl (\x (y,z) -> x:y)  0 [("1", "2"), ("2", "3")]
