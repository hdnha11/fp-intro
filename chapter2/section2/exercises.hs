main = putStrLn "Section 2.2 Booleans"

within eps x y = abs (x - y) < eps

leap y = (y `mod` 4 == 0) && (y `mod` 100 /= 0 || y `mod` 400 == 0)

leap' y
  | y `mod` 100 == 0 = y `mod` 400 == 0
  | otherwise = y `mod` 4 == 0

analyse a b c
  | a + b <= c = 0
  | a + b > c && a == c = 1
  | a + b > c && a /= c && (a == b || b == c) = 2
  | a + b > c && a < b && b < c = 3

pred n
  | n == 0 = 0
  | n > 0 = n - 1

-- bad x
--   | x > 1 = 1
--   | otherwise = False

-- Exercises

-- 2.2.1 For each of the following expressions, say whether or not it is well-formed. If the expression is well-formed, then give its value; otherwise, say whether the error is a syntax-error, type-error, or some other kind:

-- (3 == --3) && True (syntax-error)
-- 1 && 1 == 2 (type-error)
-- (1 < x && x < 100) || x == True || x == False (type-error)
-- False == (1 < 3) (False)

-- 2.2.2 Define a function sumsqrs which takes three numbers and returns the
-- sum of the squares of the larger two.

square x = x * x

sumsqrs a b c
  | a <= b && a <= c = square b + square c
  | b <= a && b <= c = square a + square c
  | c <= a && c <= b = square a + square b
  | otherwise = square a + square b
