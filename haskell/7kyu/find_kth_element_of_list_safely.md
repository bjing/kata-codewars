# Find the kth element of a list safely
## Description:

Note: This exercise expects that you already solved Find the K'th Element of a List.

Sometimes lists aren't long enough to get the k-th element. For example, we can't get the 99-th element of [1,2,3]. An implementation with type elementAt :: Int -> [a] -> a cannot report this error, so it either bottoms out (via undefined), uses error or has non-exhaustive patterns.

There's a way that doesn't result in an error. We use Maybe for this, which has only two constructors (see documentation):
```
data Maybe a = Nothing | Just a
```
Use this data type to write a safe version of elementAt:
```
elementAt :: Int -> [a] -> Maybe a
Note that elementAt should work for infinite lists.
```
Examples
```
elementAt 1    [1..] == Just 1
elementAt 4    [1..] == Just 4
elementAt (-1) [1..10] == Nothing
elementAt 0    [1..10] == Nothing
elementAt 11   [1..10] == Nothing
```
