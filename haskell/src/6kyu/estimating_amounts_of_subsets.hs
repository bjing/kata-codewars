module Kata (estSubsets) where

import Data.List
import Control.Monad

estSubsets :: Ord a => [a] -> Integer
estSubsets l = 2^(length $ dedup l) - 1

dedup :: Ord a => [a] -> [a]
dedup = fmap head . group . sort

----------------------------------------------------------------------

-- This answer is too slow to get a pass from Codewars submit tool
estSubsets' :: Ord a => [a] -> Integer
estSubsets' = toInteger . length . removeBlank . sublists . dedup

sublists :: [a] -> [[a]]
sublists = filterM (const [True, False])

dedup :: Ord a => [a] -> [a]
dedup = fmap head . group . sort

removeBlank :: Ord a => [[a]] -> [[a]]
removeBlank = tail . sort
