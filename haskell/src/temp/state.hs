import Control.Monad.State

type Stack = [Int]

popOld :: Stack -> (Int, Stack)
popOld (x:xs) = (x, xs)

pushOld :: Int -> Stack -> ((), Stack)
pushOld x xs = ((), x:xs)

stackManipOld :: Stack -> (Int, Stack)
stackManipOld stack = let
  ((), newStack1) = push 3 stack
  (a, newStack2) = pop newStack1
  in pop newStack2

pop :: State Stack Int
pop = State $ \(x:xs) -> (x, xs)

push :: Int -> State Stack ()
push a = State $ \xs -> ((), a:xs)

stackManip :: State Stack Int
stackManip = do
  push 3
  pop
  pop
