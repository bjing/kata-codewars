module CodeWars.Group.Product where
import CodeWars.Group
import Data.Monoid

instance (Group a, Group b) => Group (a, b) where
-- TODO: ...

embedLeft :: (Group a, Group b) => a -> (a,b)
-- TODO: ...

embedRight :: (Group a, Group b) => b -> (a,b)
-- TODO: ...
