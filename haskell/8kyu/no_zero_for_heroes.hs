module Codewars.G964.NoZeros where

noBoringZeros :: Int -> Int
noBoringZeros n
  | n == 0 = 0
  | divisibleByTen n = noBoringZeros (n `div` 10)
  | otherwise = n
  where divisibleByTen n = if n `mod` 10 == 0 then True else False
