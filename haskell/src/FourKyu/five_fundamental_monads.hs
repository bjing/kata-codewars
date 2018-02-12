{-# LANGUAGE NoImplicitPrelude #-}
module Monads where

import           Data.Monoid
import           Prelude     hiding (Identity, Maybe (..), Monad, Reader, State,
                              Writer)

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

data Identity a = Identity a
  deriving (Show, Eq)

data Maybe a = Nothing | Just a
  deriving (Show, Eq)

data State s a = State {runState :: s -> (a, s)}

data Reader r a = Reader {runReader :: r -> a }

data Writer w a = Writer {runWriter :: (a, w)}

instance Monad Identity where
  return = Identity
  (Identity v) >>= f = f v

instance Monad Maybe where
  return = Just
  Nothing >>= f = Nothing
  (Just v) >>= f = f v

instance Monad (State s) where
  return x = State $ \s -> (x, s)
  (State g) >>= f = State $ \s -> let (a, s') = g s
                                  in  runState (f a) s'

instance Monad (Reader s) where
  return = Reader . const
  (Reader g) >>= f = Reader $ \r -> runReader (f $ runReader (Reader g) r) r

instance Monoid w => Monad (Writer w) where
  return x = Writer (x, mempty)
  (Writer (x, v)) >>= f = let (Writer (y, v')) = f x
                          in Writer(y, v `mappend` v')
