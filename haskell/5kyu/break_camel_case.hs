import Data.Char

solution :: String -> String
solution xs = stripLeadingSpace $ solution' xs

solution' (x:[]) = x:[]
solution' (x:xs)
  | isUpper x = ' ':x:(solution xs)
  | otherwise = x:(solution' xs)

stripLeadingSpace (x:xs)
  | x == ' ' = xs
  | otherwise = x:xs
