module Haskell.Codewars.RelativePrimes where

relativelyPrime :: Integral t => t -> [t] -> [t]
relativelyPrime n (h:t)
  | gcd n h == 1 = h:(relativelyPrime n t)
  | otherwise = relativelyPrime n t
relativelyPrime n [] = []

relativelyPrime' :: Integral t => t -> [t] -> [t]
relativelyPrime' n = filter (\x -> gcd n x == 1)
