module Codewars.SumOddNumbers where

rowSumOddNumbers :: Integer -> Integer
rowSumOddNumbers n = sum[firstColumn n, firstColumn n + 2..lastColumn n]

firstColumn :: Integer -> Integer
firstColumn n = n * (n - 1) + 1

lastColumn :: Integer -> Integer
lastColumn n = firstColumn n + (n - 1) * 2
