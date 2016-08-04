module Codewars.Kata.AlternatingCase where
import Data.Char

toAlternatingCase :: String -> String
toAlternatingCase = map (\s -> if isUpper s then toLower s else toUpper s)

toAlternatingCase' :: String -> String
toAlternatingCase' (s:ss) = helper s : toAlternatingCase ss
toAlternatingCase' "" = ""

helper s = if isUpper s then toLower s else toUpper s
