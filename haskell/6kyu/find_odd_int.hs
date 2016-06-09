module Codewars.Kata.FindOdd where
import Data.Map (fromListWith, toList)

findOdd :: [Int] -> Int
findOdd xs = findOdd' countedInts
    where countedInts = frequency xs

frequency xs = toList $ fromListWith (+) (map (\x -> (x, 1)) xs)

findOdd' :: [(Int, Int)] -> Int
findOdd' ((x, y):xs)
  | odd y = x
  | otherwise = findOdd' xs
