module SquareSum where

squareSum :: [Integer] -> Integer
squareSum (x:xs) = x * x + squareSum xs
squareSum [] = 0
