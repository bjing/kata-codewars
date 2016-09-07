module Merge where

merge :: (Ord a, Num a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs ys
  | comp xs ys = xs ++ ys
  | otherwise = ys ++ xs

comp :: Ord a => [a] -> [a] -> Bool
comp [] _ = True
comp _ [] = True
comp (x:xs) (y:ys)
  | x <= y = comp xs ys
  | otherwise = False
