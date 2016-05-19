module Codewars.Kata.Multiply where

import Data.Char (digitToInt)

toDigits :: Integer -> [Integer]
toDigits = map (fromIntegral . digitToInt) . show

multiply :: Integer -> Integer
multiply n = n * (5 ^ length (toDigits (abs n)))
