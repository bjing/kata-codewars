module Codewars.Kata.Caffeine where

caffeineBuzz :: Integer -> String
caffeineBuzz i
  | divisibleBy3 = innerFunc i
  | otherwise = "mocha_missing!"
  where divisibleBy3 = i `mod` 3 == 0

innerFunc :: Integer -> String
innerFunc i
  | divisibleBy4 = "CoffeeScript"
  | isEven = "JavaScript"
  | otherwise = "Java"
  where divisibleBy4 = i `mod` 4 == 0
        isEven = i `mod` 2 == 0
