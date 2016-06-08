module FromToStepGenerator where

generator :: Integer -> Integer -> Integer -> [Integer]
generator start end step
  | start < end = [start, start+step..end]
  | otherwise = [start, start-step..end]
  
