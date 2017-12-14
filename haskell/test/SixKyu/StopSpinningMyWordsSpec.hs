module SixKyu.StopSpinningMyWordsSpec where

import SixKyu.StopSpinningMyWords (spinWords)
import Test.Hspec

spec :: Spec
spec =
  describe "spinWords" $
    it "should work for some examples" $ do
      spinWords "Hey fellow warriors" `shouldBe` "Hey wollef sroirraw"
      spinWords "Test"                `shouldBe` "Test"
      spinWords "Example"             `shouldBe` "elpmaxE"
      spinWords "Test Example"        `shouldBe` "Test elpmaxE"