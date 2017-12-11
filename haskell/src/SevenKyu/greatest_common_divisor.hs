module Codewars.Kata.GCD where
import Prelude hiding (gcd, lcm)

-- Using Eclidean algorithm

gcd :: Integral n => n -> n -> n
gcd x 0 = x
gcd x y = gcd y $ x `mod` y
