module Codewars.G964.StepInPrimes where

step :: Integer -> Integer -> Integer -> Maybe (Integer, Integer)
step g m n
  | n - m < g = Nothing
  | isPrime m && isPrime (m + g) = Just (m, m + g)
  | otherwise = step g (m + 1) n

isPrime :: Integer -> Bool
isPrime n = null $ filter (\x -> n `mod` x == 0) [2..(floor . sqrt $ fromIntegral n)]
