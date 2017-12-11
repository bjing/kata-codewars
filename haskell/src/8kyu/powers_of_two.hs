module PowersOfTwo where

powersOfTwo :: Int -> [Int]
powersOfTwo n = fmap (\x -> 2 ^ x) [0..n]
