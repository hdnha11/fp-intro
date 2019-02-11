main = putStrLn "Section 1.4"

-- Exercises
-- 1.4.1 Describe one appropriate type for the definite integral function of mathematical analysis, as used in the phrase 'the integral of f from a to b'.

-- integral :: (num -> num) -> num -> num -> num
-- integral f a b' = ...

-- 1.4.2 Give examples of functions with the following types:
--       (num -> num) -> num
--       num -> (num -> num)
--       (num -> num) -> (num -> num)

-- (num -> num) -> num
calcTen :: Num num => (num -> num) -> num
calcTen calculator = calculator 10

-- num -> (num -> num)
plus :: Num num => num -> (num -> num)
plus step n = n + step

-- (num -> num) -> (num -> num)
exec :: Num num => (num -> num) -> (num -> num)
exec f x = f x

-- 1.4.3 Give a definition of a function sign :: num -> num which returns 1 if its argument is positive, -1 if its argument is negative, and 0 otherwise.

sign :: Double -> Int
sign x
  | x > 0 = 1
  | x < 0 = -1
  | otherwise = 0

-- 1.4.4 Suggest possible types for the following functions:
--       one x = 1
--       apply f x = f x
--       compose f g x = f (g x)

one :: a -> Int
one x = 1

apply :: (a -> b) -> a -> b
apply f x = f x

compose :: (a -> b) -> (c -> a) -> c -> b
compose f g x = f (g x)
