module Codewars.Kata.Beats where

beasts :: Integer -> Integer -> Maybe (Integer, Integer)
beasts heads tails
  | isInt hydra = Just (tails - hydra, hydra)
  | otherwise = Nothing
  where hydra = (heads - tails) / 3

isInt :: Num a => a -> Bool
isInt x = x == round x

--2 * numOrthus + 5 * numHydra = numHeads
--numOrthus + numHydra = numTails
