module Codewars.G964.Getmiddle where

getMiddle :: String -> String
getMiddle s
  | odd $ length s = take 1 $ drop halfLength s
  | even $ length s = take 2 $ drop (halfLength - 1) s
  where halfLength = length s `div` 2
