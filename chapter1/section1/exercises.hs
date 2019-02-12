main = putStrLn "Section 1.1 Functional programming"

square x = x * x

min x y
  | x <= y = x
  | x > y = y

-- Exercises
-- 1.1.1 Using the function square, design a function quad which raises its argument to the fourth power.
quad x = square (square x)

-- 1.1.2 Define a function max which returns the greater of its two arguments.
-- max x y = if x >= y then x else y
max x y
  | x >= y = x
  | otherwise = y

-- 1.1.3 Define a function for computing the area of a circle with given radius
-- r (use 22/7 as an approximation to pi").
-- pi = 22 / 7
area r = pi * square r
