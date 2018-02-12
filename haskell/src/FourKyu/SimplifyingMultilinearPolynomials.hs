module FourKyu.SimplifyingMultilinearPolynomials where

import           Data.Char
import           Data.List
import           Data.List.Split
import qualified Data.Map        as M
import           Data.Ord        (comparing)
import           GHC.Exts

simplify :: String -> String
simplify = combineIt . transformIt . splitIt

-- Split polynomials
splitIt :: String -> [String]
splitIt = filter (not. null) . split (keepDelimsL $ oneOf "+-")

-- Combine transformed split polynomials terms back together
combineIt :: [String] -> String
combineIt = removeLeadingPlus . concat

-- Add up coefficients for elements with the same indeterminates
transformIt :: [String] -> [String]
transformIt = removeZeroTerms . reconTerms . tupleSort . sumCoeffs . separateCoeffs


----------------------
-- Helper functions
----------------------

-- Remove leading + sign for processed polynomial string
removeLeadingPlus :: String -> String
removeLeadingPlus s
  | "+" `isPrefixOf` s = tail s
  | otherwise = s

-- Separate coefficient from each term and store coeff and indeterminate in a tuple
-- Also group all elements that have the same indeterinates
separateCoeffs :: [String] -> [([String], [String])]
separateCoeffs = (map unzip . groupWith snd) . map separateCoeffForTerm

-- Separate coefficient from indeterinate for a single term
separateCoeffForTerm :: String -> (String, String)
separateCoeffForTerm s = ((normaliseCoeffPre . extractCoeff) s, extractBase s)

sumCoeffs :: [([String], [String])] -> [(String, Int)]
sumCoeffs = M.toList . sumCoeffs' . M.fromListWith (++) . groupCoeffs

groupCoeffs :: [([String], [String])] -> [(String, [String])]
groupCoeffs = map (\(xs, h:_) -> (sort h, xs))

-- Sum coefficients for each group
sumCoeffs' :: M.Map String [String] -> M.Map String Int
sumCoeffs' = M.map (sum . map stringToInt)

-- Combine coeffs and indeterminates
reconTerms :: [(String, Int)] -> [String]
reconTerms = map (\(n, i) -> normaliseCoeffPost (intToString i ++ n))

-- Remove terms with 0 coefficients
removeZeroTerms :: [String] -> [String]
removeZeroTerms = filter (not . isPrefixOf "+0")

-- Extract coefficient from an element
extractCoeff :: String -> String
extractCoeff = takeWhile (not . isAlpha)

-- Extract indeterminates from an element
extractBase :: String -> String
extractBase = dropWhile (not . isAlpha)

-- Normalise coefficients for processing
normaliseCoeffPre :: String -> String
normaliseCoeffPre c
  | c == "-" = "-1"
  | c == "+" || c == "" = "1"
  | c == "+0" || c == "-0" = "0"
  | isPrefixOf "+" c && length c > 1 = drop 1 c
  | otherwise = c

-- Normalise strings after processing
normaliseCoeffPost :: String -> String
normaliseCoeffPost s
  | extractCoeff s == "-1" = "-" ++ extractBase s
  | extractCoeff s == "1" = "+" ++ extractBase s
  | not $ isPrefixOf "-" s = "+" ++ s
  | otherwise = s

-- Sort list of tuples of (Int, String) given length of the second string
tupleSort :: [(String, Int)] -> [(String, Int)]
tupleSort = sortBy (comparing $ length . fst)

-- String and Int conversions
intToString :: Int -> String
intToString = show
stringToInt :: String -> Int
stringToInt s = read s :: Int


----------------
-- Sample input
----------------
--sample = "2abc-bc-abc"
--sample1 = "dc+dcba"
--sample2 = "2xy-yx"
--sample3 = "-a+5ab+3a-c-2a"
--sample4 = "-abc+3a+2ac"
--sample5 = "xyz-xz"
--sample6 = "-abc+3a+2ac"
--sample7 = "4y-8dy+14dyz-24dyz"
--sample8 = "-3dyz+4y-8dy+14dyz-24dyz-3y-y"
