module Xbonacci where

xbonacci :: Num a => [a] -> Int -> [a]
xbonacci as n
  | n <= 0 = []
  | n < k = take n as
  | otherwise = xbo' as k n
  where k = length as

xbo' xs k n
  | l < n = xbo' (xs ++ [sum $ take k $ reverse xs]) k n
  | otherwise = xs
  where l = length xs
