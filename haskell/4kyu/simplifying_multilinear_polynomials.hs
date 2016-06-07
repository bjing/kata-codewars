module Codewars.Kirilloid.MultilinearPolynomials where
import Data.List
import Data.List.Split
import Data.Char
import GHC.Exts
import Data.Ord (comparing)

simplify :: String -> String
simplify = combineIt . transformIt . splitIt

-- Split polynomials
splitIt :: String -> [String]
splitIt = (map sort) . (filter (\e -> length e /= 0)) . split (keepDelimsL $ oneOf "+-")

-- Combine transformed split polynomials terms back together
combineIt :: [String] -> String
combineIt = removeLeadingPlus . (foldl (++) "")

-- Add up coefficients for elements with the same indeterminates
transformIt = removeZeroTerms . reconTerms . tupleSort . sumCoeffs . separateCoeffs

----------------------
-- Helper functions
----------------------
-- Remove leading + sign for processed polynomial string
removeLeadingPlus s
  | isPrefixOf "+" s = tail s
  | otherwise = s

-- Separate coefficient from each term and store coeff and indeterminate in a tuple
-- Also group all elements that have the same indeterinates
separateCoeffs = (map unzip . groupWith (\(c, n) -> n)) . (map separateCoeffForTerm)
-- Separate coefficient from indeterinate for a single term
separateCoeffForTerm s = ((normaliseCoeffPre . extractCoeff) s, extractBase s)
-- Sum coefficients for each group
sumCoeffs = map (\(c, n) -> (sum(map stringToInt c), (head n)))
-- Combine coeffs and indeterminates
reconTerms = map (\(i, n) -> normaliseCoeffPost (intToString i ++ n))
-- Remove terms with 0 coefficients
removeZeroTerms = filter (\t -> not $ isPrefixOf "+0" t)

-- Extract coefficient from an element
extractCoeff = takeWhile (not . isAlpha)
-- Extract indeterminates from an element
extractBase = dropWhile (not . isAlpha)

-- Normalise coefficients for processing
normaliseCoeffPre :: [Char] -> [Char]
normaliseCoeffPre c
  | c == "-" = "-1"
  | c == "+" || c == "" = "1"
  | c == "+0" || c == "-0" = "0"
  | isPrefixOf "+" c && length c > 1 = drop 1 c
  | otherwise = c
-- Normalise strings after processing
normaliseCoeffPost s
  | (extractCoeff s) == "-1" = "-" ++ (extractBase s)
  | (extractCoeff s) == "1" = "+" ++ (extractBase s)
  | not $ isPrefixOf "-" s = "+" ++ s
  | otherwise = s

-- Sort list of tuples of (String, String) given length of the second string
tupleSort = sortBy (comparing $ length . snd)

-- String and Int conversion
intToString :: Int -> String
intToString i = show i
stringToInt :: String -> Int
stringToInt s = (read s) :: Int

----------------
-- Sample input
----------------
sample = "2abc-bc-abc"
sample1 = "dc+dcba"
sample2 = "2xy-yx"
sample3 = "-a+5ab+3a-c-2a"
sample4 = "-abc+3a+2ac"
sample5 = "xyz-xz"
sample6 = "-abc+3a+2ac"
sample7 = "4y-8dy+14dyz-24dyz"
sample8 = "-3dyz+4y-8dy+14dyz-24dyz-3y-y"


-- Notes
-- splitRes = ["+2abc", "-bc", "-abc"]
-- separateRes = map separateCoefficients splitRes
-- res1 = (map unzip . groupWith (\(c, n) -> n)) separateRes
-- res2 = map (\(c, n) -> (sum(map stringToInt c), (head n))) res1
-- res 3 = map (\(i, n) -> normalise (intToString i ++ n)) res2

-- ["+2abc", "-bc", "-abc"]
-- foldl (\x (y,z) -> x:y)  0 [("1", "2"), ("2", "3")]
