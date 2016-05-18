module KthElement where
import Prelude hiding ((!!))

-- | Returns Just the k-th element of the list, or Nothing if k is out of bounds.
elementAt :: Int -> [a] -> Maybe a
elementAt n xs
  | (n > length xs) || (n < 1) = Nothing
  | n == 1 = Just (head xs)
  | otherwise = elementAt (n - 1) (tail xs)
