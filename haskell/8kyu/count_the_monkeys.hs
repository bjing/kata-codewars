module Codewars.Kata.Monkeys where

monkeyCount :: Int -> [Int]
monkeyCount x
  | x < 1 = []
  | otherwise = [1..x]
