module Codewars.G964.GapInPrimes where

gap :: Integer -> Integer -> Integer -> Maybe (Integer, Integer)
gap g m n
  | null $ take 2 primeList = Nothing
  | otherwise = testPrimes g primeList
  where primeList = filter isPrime [m..n]

testPrimes :: Integer -> [Integer] -> Maybe (Integer, Integer)
testPrimes g (x:[]) = Nothing
testPrimes g (x:y:xs)
  | x + g == y = Just (x, y)
  | otherwise = testPrimes g (y:xs)

isPrime :: Integer -> Bool
isPrime n = null $ filter (\x -> n `mod` x == 0) [2..(floor $ sqrt $ fromIntegral n)]
