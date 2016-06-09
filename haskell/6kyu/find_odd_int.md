Given an array, find the int that appears an odd number of times.

There will always be only one integer that appears an odd number of times.





--findOdd' :: [Int] -> Int
--findOdd' xs = findOddInt $ M.toList countedInts
--  where countedInts = countInts xs counts
--        counts = M.fromList $ map (\x -> (x, 0)) xs

--findOddInt :: [(Int, Int)] -> Int
--findOddInt ((x,y):xs)
--  | odd y = y
--  | otherwise = findOddInt xs

--countInts (x:xs) counts =
--  map (\(a, b) -> if a == x then fromJust (lookup x counts) + 1) counts
--  M.insert x (fromJust $ (M.lookup x counts) + 1) counts
