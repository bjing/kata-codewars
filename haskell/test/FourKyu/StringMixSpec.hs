module FourKyu.StringMixSpec where

import FourKyu.StringMix (mix)
import Test.Hspec
import Text.Printf (printf)

testMix :: String -> String -> String -> Spec
testMix s1 s2 s =
  it (printf "should return mix for s1: %s, s2: %s " s1 s2) $
    mix s1 s2 `shouldBe` s

spec :: Spec
spec =
  describe "Mix: Basic Tests" $ do
    testMix  "Are they here" "yes, they are here" "2:eeeee/2:yy/=:hh/=:rr"
    testMix  "looping is fun but dangerous" "less dangerous than coding" "1:ooo/1:uuu/2:sss/=:nnn/1:ii/2:aa/2:dd/2:ee/=:gg"
    testMix  " In many languages" " there's a pair of functions" "1:aaa/1:nnn/1:gg/2:ee/2:ff/2:ii/2:oo/2:rr/2:ss/2:tt"
    testMix  "Lords of the Fallen" "gamekult" "1:ee/1:ll/1:oo"
    testMix  "codewars" "codewars" ""
    testMix  "A generation must confront the looming " "codewarrs" "1:nnnnn/1:ooooo/1:tttt/1:eee/1:gg/1:ii/1:mm/=:rr"