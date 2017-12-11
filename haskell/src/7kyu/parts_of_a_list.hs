module Codewars.G964.Partlist where
import Data.List

partlist :: [String] -> [(String, String)]
partlist arr = innerFunc (length arr) arr

innerFunc n l
  | n > 2 = combine (take (length l - n + 1) l) (drop (length l - n + 1) l) ++ innerFunc (n - 1) l
  | n == 2 = combine (take (length l - 1) l) (drop (length l - 1) l)

combine l1 l2 = [(unwords l1, unwords l2)]
