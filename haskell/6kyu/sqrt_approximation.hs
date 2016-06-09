module CodeWars.Sqrt where
import Prelude hiding (sqrt)

sqrtInt :: Integral n => n -> Either (n,n) n
sqrtInt n
  | x == y = Right x
  | otherwise = Left (x, y)
  where (x, y) = getSqrt n [0..n]

getSqrt :: Integral n => n -> [n] -> (n, n)
getSqrt n (x:xs)
  | x^2 == n = (x, x)
  | x^2 > n = (x-1, x)
  | otherwise getSqrt n xs
