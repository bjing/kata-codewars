import Data.Char

solution :: String -> String
solution (x:[]) = x:[]
solution (x:xs)
  | isUpper x = ' ':x:(solution xs)
  | otherwise = x:(solution xs)
