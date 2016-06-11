module Codewars.Kata.Filter where
import Data.Char (isDigit)

filterString :: String -> Int
filterString s = read (filterInts s) :: Int

filterInts :: String -> String
filterInts s = reverse $ foldl (\z a -> if isDigit a then a:z else z) "" s

filterString' :: String -> Int
filterString' = read . filter isDigit
