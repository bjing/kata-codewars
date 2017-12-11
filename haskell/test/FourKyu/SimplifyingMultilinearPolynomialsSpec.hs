module FourKyu.SimplifyingMultilinearPolynomialsSpec where

import FourKyu.SimplifyingMultilinearPolynomials

import Test.Hspec
import Test.QuickCheck
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "Sample tests" $ do
    it "Test reduction by equivalence" $ do
      simplify "dc+dcba" `shouldBe` "cd+abcd"
      simplify "2xy-yx" `shouldBe` "xy"
      simplify "-a+5ab+3a-c-2a" `shouldBe` "-c+5ab"
    it "Test monomial length ordering" $ do
      simplify "-abc+3a+2ac" `shouldBe` "3a+2ac-abc"
      simplify "xyz-xz" `shouldBe` "-xz+xyz"
    it "Test lexicographic ordering" $ do
      simplify "a+ca-ab" `shouldBe` "a-ab+ac"
      simplify "xzy+zby" `shouldBe` "byz+xyz"
    it "Test no leading +" $ do
      simplify "-y+x" `shouldBe` "x-y"
      simplify "y-x" `shouldBe` "-x+y"

  describe "Split" $
    it "should " $
      splitIt "-12dy+9yzd-9dyz-13y+8y-10yzd-11yd+15yd+9y" `shouldBe` ["-12dy","+9dyz","-9dyz","-13y","+8y","-10dyz","-11dy","+15dy","+9y"]