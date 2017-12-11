module Merge where

merge :: (Ord a, Num a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs ys = comp xs ys []

comp :: Ord a => [a] -> [a] -> [a] -> [a]
comp [] ys acc = acc ++ ys
comp xs [] acc = acc ++ xs
comp (x:xs) (y:ys) acc
  | x <= y = comp xs (y:ys) (acc ++ [x])
  | otherwise = comp (x:xs) ys (acc ++ [y])
