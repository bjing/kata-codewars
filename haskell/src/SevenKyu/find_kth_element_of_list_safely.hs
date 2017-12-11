module KthElement where
import Prelude hiding ((!!))

-- | Returns Just the k-th element of the list, or Nothing if k is out of bounds.
elementAt :: Int -> [a] -> Maybe a
elementAt k l
  | k < 1 || isLongerThan k l || not (isNonEmpty l) = Nothing
  | otherwise = Just $ last $ take k l

isNonEmpty :: [a] -> Bool
isNonEmpty [] = False
isNonEmpty (x:xs) = True

isLongerThan :: Int -> [a] -> Bool
isLongerThan n l = (length $ take n l) < n


elementAt' :: Int -> [a] -> Maybe a
elementAt' _ [] = Nothing
elementAt' k (x:xs)
  | k < 1 = Nothing
  | k == 1 = Just x
  | otherwise = elementAt' (k - 1) xs
