main = putStrLn "Section 2.6 Functions"

-- (f.g).h = f.(g.h)

-- f (f^-1 y) = y

sign x
  | x > 0 = 1
  | x < 0 = -1
  | otherwise = 0

fn x = (sign x, abs x)

fn_1 (s, a) = s * a

three x = 3

cond p x y
  | p = x
  | otherwise = y

recip x
  | x == 0 = 0
  | otherwise = 1 / x

recip' x = cond (x == 0) 0 (1 / x)

-- Exercises

-- 2.6.1 Suppose h x y = f (g x y). Which of the following statements are true?
-- h = f.g
-- h x = f.(g x)
-- h x y = (f.g) x y

-- h = f.g (false)
-- h x = f.(g x) (true)
-- h x y = (f.g) x y (false)

-- 2.6.2 Write down a definition of a function with type (num -> num) which returns no well-defined values.

ff :: Num num => num -> num
ff x = undefined

-- 2.6.3 Consider the function halve = (div 2). Is it possible to specify a function f by the requirement:
-- f (halve x) = x
-- for all natural numbers x? Give one function f that satisfies the equation:
-- halve (f x) = x

halve = (`div` 2)

f x = x * 2

-- 2.6.4 Show that the function (f.g) is strict if both f and g are strict.

-- 2.6.5 Define the operators of logical conjunction and disjunction, using only the function cond. Draw up a table showing their values for all possible arguments, well-defined or otherwise.

a x y = cond (x == True) y x
o x y = cond (x == False) y x
