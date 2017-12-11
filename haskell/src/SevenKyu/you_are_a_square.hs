module Codewars.Kata.Square where

isSquare :: Integral n => n -> Bool
isSquare n = ((floor . sqrt . fromIntegral) n)^2 == n
