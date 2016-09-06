module Merge where

merge :: (Ord a, Num a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs ys
  | sum xs < sum ys = xs `mappend` ys
  | otherwise = ys `mappend` xs

comp :: Ord a => [a] -> [a] -> Bool
comp [] [] = True
comp [] _ = True
comp _ [] = False
comp (x:xs) (y:ys)
  | x < y = comp xs ys
  | otherwise = False
