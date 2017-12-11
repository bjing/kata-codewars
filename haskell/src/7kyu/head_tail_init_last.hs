module ListOps where
import Prelude hiding (head, tail, init, last)

head :: [a] -> a
head (x:xs) = x
head [] = error "empty list"

tail :: [a] -> [a]
tail (x:xs) = xs
tail [] = error "empty list"

init :: [a] -> [a]
init xs = reverse (drop 1 (reverse xs))

last :: [a] -> a
last [] = error "empty list"
last (x:xs)
	| length xs == 0 = x
  | otherwise = last xs
