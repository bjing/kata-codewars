# Description:

We want to approximate the sqrt function. Usually this functions takes a floating point number and returns another floating point number, but in this kata we're going to work with integral numbers instead.

Your task is to write a function that takes an integer n and returns either

- an integer k if n is a square number, such that k * k == n or
- a range (k, k+1), such that k * k < n and n < (k+1) * (k+1).

## Examples
```
sqrtInt :: Integral n => n -> Either (n,n) n
sqrtInt 4 `shouldBe` Right 2
sqrtInt 5 `shouldBe` Left (2,3)
```

## Remarks
In dynamic languages, return either a single value or an array/list. In Haskell, use Either.
