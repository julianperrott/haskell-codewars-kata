{- http://www.codewars.com/kata/525f039017c7cd0e1a000a26

Number is a palindrome if it is equal to the number with digits in reversed order. For example, 5, 44, 171, 4884 are palindromes and 43, 194, 4773 are not palindromes.

Write a method palindrome_chain_length which takes a positive number and returns the number of special steps needed to obtain a palindrome. The special step is: "reverse the digits, and add to the original number". If the resulting number is not a palindrome, repeat the procedure with the sum until the resulting number is a palindrome.

If the input number is already a palindrome, the number of steps is 0.

Input will always be a positive integer.

For example, start with 87:

87 + 78 = 165; 165 + 561 = 726; 726 + 627 = 1353; 1353 + 3531 = 4884

4884 is a palindrome and we needed 4 steps to obtain it, so palindrome_chain_length(87) == 4

-}

module Codewars.PalindromeChain where
import Test.Hspec
import Data.List.Split

palindromeChainLength :: Integer -> Integer
palindromeChainLength l = recursePalindromeChain l 0

recursePalindromeChain:: Integer -> Integer -> Integer
recursePalindromeChain n len
    | show n == reverse (show n) = len
    | otherwise = recursePalindromeChain ( (n+) $ read $ reverse $ show n) (len+1)


{-
reverseNumber :: Integer -> Integer
reverseNumber = read . reverse . show

step :: Integer -> Integer
step x = let r = reverseNumber x in x + r

palindromeChainLength :: Integer -> Integer
palindromeChainLength = fromIntegral .length . takeWhile (\x -> x /= reverseNumber x) . iterate step
-}


test = hspec $ do
  describe "palindromeChainLength" $ do
    it "should work for 87 -> 4" $ do palindromeChainLength 87 `shouldBe` 4
    it "should work for 89 -> 24" $ do palindromeChainLength 89 `shouldBe` 24

{-
Number is a palindrome if it is equal to the number with digits in reversed order. For example, 5, 44, 171, 4884 are palindromes and 43, 194, 4773 are not palindromes.

Write a method palindrome_chain_length which takes a positive number and returns the number of special steps needed to obtain a palindrome. The special step is: "reverse the digits, and add to the original number". If the resulting number is not a palindrome, repeat the procedure with the sum until the resulting number is a palindrome.

If the input number is already a palindrome, the number of steps is 0.

Input will always be a positive integer.

For example, start with 87:

87 + 78 = 165; 165 + 561 = 726; 726 + 627 = 1353; 1353 + 3531 = 4884

4884 is a palindrome and we needed 4 steps to obtain it, so palindrome_chain_length(87) == 4
-}
