module SixKyu.StopSpinningMyWords where

spinWords :: String -> String
spinWords = unwords . map rev . words
  where
    rev str = if length str >= 5 then reverse str else str

spinWords' :: String -> String
spinWords' = unwords . map (\s -> if length s >= 5 then reverse s else s) . words
