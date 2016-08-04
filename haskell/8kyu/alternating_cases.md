altERnaTIng cAsE <=> ALTerNAtiNG CaSe

Define `String.prototype.toAlternatingCase (StringUtils.toAlternatingCase(String)` in Java) such that each lowercase letter becomes uppercase and each uppercase letter becomes lowercase. For example:
```
toAlternatingCase "hello world" `shouldBe` "HELLO WORLD"
toAlternatingCase "HELLO WORLD" `shouldBe` "hello world"
toAlternatingCase "hello WORLD" `shouldBe` "HELLO world"
toAlternatingCase "HeLLo WoRLD" `shouldBe` "hEllO wOrld"
toAlternatingCase "12345"       `shouldBe` "12345"
toAlternatingCase "1a2b3c4d5e"  `shouldBe` "1A2B3C4D5E"
Note to no Java langs
```
You must `NOT` alter the original string.
