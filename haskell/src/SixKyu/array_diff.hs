module Difference where

difference :: Eq a => [a] -> [a] -> [a]
difference a b = filter (\x -> not $ x `elem` b) a
