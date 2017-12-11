module Kth where
import Prelude hiding ((!!))

elementAt :: [a] -> Int -> a
elementAt (x:xs) p
  | p == 1 = x
  | otherwise = elementAt xs (p - 1)
