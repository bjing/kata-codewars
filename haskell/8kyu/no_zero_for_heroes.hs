module Codewars.G964.NoZeros where

noBoringZeros :: Int -> Int
noBoringZeros n
  | n == 0 = 0
  | n `mod` 10 == 0 = noBoringZeros $ n `div` 10
  | otherwise = n
