module Tribonacci where

-- handle negative n value
tribonacci :: Num a => (a, a, a) -> Int -> [a]
tribonacci (a, b, c) n
  | n <= 0 = []
  | n < 4 = take n [a, b, c]
  | otherwise = reverse $ tribo' [c, b ,a] n

tribo' :: Num a => [a] -> Int -> [a]
tribo' xs n
  | length xs < n = tribo' (sum (take 3 xs):xs) n
  | otherwise = xs
