module Tribonacci where

-- handle negative n value
tribonacci :: Num a => (a, a, a) -> Int -> [a]
tribonacci (a, b, c) n
  | n <= 0 = []
  | n < 4 = take n [a, b, c]
  | otherwise = tribo' [a, b, c] n

tribo' xs n
  | length xs < n = tribo' (xs ++ [sum $ take 3 $ reverse xs]) n
  | otherwise = xs
