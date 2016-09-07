# Description

A [group](https://en.wikipedia.org/wiki/Group_(mathematics) is a [monoid](https://hackage.haskell.org/package/base-4.2.0.1/docs/Data-Monoid.html) plus a function, invert, with the following signature:
```
class Monoid m => Group m where
  invert :: m -> m
```
A group obeys all of the rules of a Monoid (ie. [associativity](https://en.wikipedia.org/wiki/Associative_property) and [identity](https://en.wikipedia.org/wiki/Identity_element)), as well as invertibility:
```
a <> invert a == mempty
invert a <> a == mempty
```
Where ``(<>)`` is the binary monoid operator from Data.Monoid.

The [category](https://en.wikipedia.org/wiki/Category_theory) of groups (aka Grp) is known to be closed under products.

To show this,

1. Complete the following instance
```
instance (Group a, Group b) => Group (a, b) where
-- TODO: ...
```
2. Write two [injective](https://en.wikipedia.org/wiki/Injective_function) [group homomorphisms](https://en.wikipedia.org/wiki/Group_homomorphism)


- `embedLeft :: (Group a, Group b) => a -> (a,b)`
- `embedRight :: (Group a, Group b) => b -> (a,b)`
```
such that the following commutes:

Commutative Diagram

Or, equationally,
```
-- Group homomorphism rules
embedLeft x <> embedLeft y == embedLeft (x <> y)
invert (embedLeft x) == embedLeft (invert x)
embedRight x <> embedRight y == embedRight (x <> y)
invert (embedRight x) == embedRight (invert x)

-- Commutative diagram rules
fst (embedLeft x) == x
snd (embedRight x) == x
```
Follow Up: How can the contexts for `embedLeft` and `embedRight` be generalized? This reflects a fact about another category related to Grp. Which category is it, and what is the property it has? How might we write tests for this?
FUNDAMENTALSMATHEMATICSALGORITHMSNUMBERS
