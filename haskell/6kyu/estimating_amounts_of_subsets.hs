module Kata (estSubsets) where

import Data.List

estSubsets :: Ord a => [a] -> Integer
estSubsets = toInteger . length . sublists

sublists :: Ord a => [a] -> [[a]]
sublists l = tail . dedup . concatMap inits $ tails l

dedup :: Ord a => [[a]] -> [[a]]
dedup = fmap head . group. sort
