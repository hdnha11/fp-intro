import Data.Char

main = putStrLn "Section 2.3 Characters and strings"

isdigit x = '0' <= x && x <= '9'
isupper x = 'A' <= x && x <= 'Z'
islower x = 'a' <= x && x <= 'z'

capitalise :: Char -> Char
capitalise x
  | islower x = chr (offset + ord x)
  | otherwise = x
  where offset = ord 'A' - ord 'a'

ljustify, cjustify, rjustify :: Int -> String -> String

ljustify n x
  | n >= m =  x ++ space (n - m)
  where m = length x

rjustify n x
  | n >= m =  space (n - m) ++ x
  where m = length x

cjustify n x
  | n >= m =  space lm ++ x ++ space rm
  where m = length x
        lm = (n - m) `div` 2
        rm = (n - m) - lm

space :: Int -> String
space n = [' ' | i <- [1..n]]

-- Exercises

-- 2.3.1 Define a function nextlet which takes a letter of the alphabet and returns the letter coming immediately after it. Assume that letter A follows Z.

nextlet l
  | islower l = chr (next (ord 'a'))
  | otherwise = chr (next (ord 'A'))
  where next s = s + ((ord l - s + 1) `mod` 26)

-- 2.3.2 Define a function digitval which converts a digit character to its corresponding numerical value.

digitval d
  | isdigit d = ord d - ord '0'
  | otherwise = undefined

-- 2.3.3 Put the following strings in ascending order: "McMillan", "MacmilIan", and "MacMillan".

-- "MacMillan", "MacmilIan", "McMillan"

-- 2.3.4 What are the values of the following expressions?
-- show (show 42)
-- show 42 ++ show 42
-- show "\n"

-- show (show 42)
-- "\"42\""
-- show 42 ++ show 42
-- "4242"
-- show "\n"
-- "\n"

-- 2.3.5 Define total versions of the justification functions of Section 2.3.2 so that, for example, (cjustify n x) returns x if its length is longer than n.

cjustify' n x
  | n >= m =  space lm ++ x ++ space rm
  | otherwise = x
  where m = length x
        lm = (n - m) `div` 2
        rm = (n - m) - lm
