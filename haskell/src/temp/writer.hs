-- import Data.Monoid
-- import Prelude hiding (Monad, Identity, Maybe(..), State, Reader, Writer, return)
--
-- class Monad m where
--   return :: a -> m a
--   (>>=) :: m a -> (a -> m b) -> m b
--
-- data Writer w a = Writer {runWriter :: (a, w)}
--
-- instance (Monoid w) => Monad (Writer w) where
--   return x = Writer (x, mempty)
--   (Writer (x, v)) >>= f = let Writer (y, v') = f x
--                           in Writer(y, v `mappend` v')

-- half :: Int -> Writer String Int
-- half x = do
--   tell ("I just halved " `mappend` (show x) `mappend` "! ")
--   return (x `div` 2)

import Control.Monad.Writer
logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    return (a*b)
