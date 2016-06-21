module PointsOnALine where
import Data.List
import Data.Set (fromList, toList)

-- | We use Rational because Double is prone to rounding errors.
type Point = (Rational, Rational)

-- | Decide whether all points lie on a line.
onLine :: [Point] -> Bool
onLine ps
  | length uniqps <= 1 = True
  | otherwise = (==1) $ length $ dedup $ map calculateSlope (pairCombinations uniqps)
  where uniqps = dedup ps

dedup :: Ord a => [a] -> [a]
dedup = toList . fromList

pairCombinations :: [a] -> [[a]]
pairCombinations = filter ((==2) . length) . subsequences

calculateSlope :: (Eq a, Num a, Fractional a) => [(a, a)] -> a
calculateSlope [(a, b), (c, d)]
  | c == a = -1
  | otherwise = abs $ (d - b) / (c - a)
