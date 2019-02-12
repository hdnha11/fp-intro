main = putStrLn "Section 2.1 Numbers"

both f x = f x x

-- Sections
double = both (+)
double' = (*2)
recip = (1/)
half = (/2)
succ = (+1)

-- (-x)
subtract x y = y - x

-- Computing square roots
-- eps = 0.001

-- abs x
--   | x < 0 = -x
--   | otherwise = x

-- improve x y = (y + x/y)/2

-- satis x y = abs (y^2 - x) < eps

-- until p f x
--   | p x = x
--   | otherwise = until p f (f x)

-- sqrt x = until (satis x) (improve x) x

sqrt x = until satis improve x
    where satis y = abs (y^2 - x) < eps
          improve y = (y + x/y)/2
          eps = 0.0001

deriv f x = (f (x + dx) - f x)/dx
    where dx = 0.0001

newton f = until satis improve
    where satis y = abs (f y) < eps
          improve y = y - (f y/deriv f y)
          eps = 0.0001

sqrt' x = newton f x
    where f y = y^2 - x

-- Exercises
-- 2.1.1 The operators * and div have the same binding power and associate to the left. What, therefore, is the value of the following expressions?

-- 3 div 1 * 3
-- 3 * 7 div 4
-- 6 div 2 * 8 div 4

-- 3 div 1 * 3 = 9
-- 3 * 7 div 4 = 5
-- 6 div 2 * 8 div 4 = 6

-- 2.1.2 Using the definition of mod given in Section 2.1.3, show that for all positive x, y and z:

-- (x + y) mod z = (x mod z + y mod z) mod z
-- x * (y mod z) = (x * y) mod (x * z)

-- Given
-- x = q * y + r and 0 <= r < y

-- (x mod z + y mod z) mod z = (x mod z + y mod z) - q * z
--                           = x - q1 * z + y - q2 * z - q * z
--                           = x + y - (q1 + q2 + q) * z
--                           = (x + y) mod z

-- (x * y) mod (x * z) = x * y - q * x * z
--                     = x * (y - q * z)
--                     = x * (y mod z)

-- 2.1.3 Assuming all the integers x, y and z are in range, prove that:

-- x div 2 + (x + 1) div 2 = x
-- (x * y) div y = x
-- (x div y) div z = x div (y * z)

-- x div 2 + (x + 1) div 2 = (x - r1) / 2 + (x + 1 - r2) / 2
--                         = 2 * x / 2 (r1 = 0, r2 = 1 if x even or r1 = 1, r2 = 0 if x odd)
--                         = x

-- (x div y) div z = ((x div y) - r) / z
--                 = ((x - r1) / y - r) / z
--                 = (x - r1 - y * r) / (y * z)
--                 = (x - (r1 + y * r)) / (y * z)
--                 = x div (y * z)

-- 2.1.4 What function is (+(-x))?

-- f x y = y - x

-- 2.1.5 For what arguments do the following functions return True?

-- (=9).(2+).(7*)
-- (3>).(mod 2)

-- f1 = (==9).(2+).(7*)
-- f1 1
-- True
-- f2 = (3>).(mod 2)
-- f2 3
-- True

-- 2.1.6 Which of the following statements are true (if any)?

-- (*)x = (*x) (true)
-- (+)x = (x+) (true)
-- (-)x = (-x) (false)

-- 2.1.7 In Newton's method, the test for determining whether an approximation y to sqrt x is good enough was defined to be:

-- abs (y^2 - x) < eps

-- Another test is:

-- abs (y^2 - x) < eps * x

-- Rewrite the sqrt function to use this test.

sqrt'' x = until statis improve x
    where statis y = abs (y^2 - x) < eps * x
          improve y = (y + x/y) / 2
          eps = 0.001

-- Yet another test for convergence is to stop when two successive approximations y and y' are sufficiently close:

-- abs (y - y') < eps * abs y

-- Rewrite the definition of sqrt to use this new test. Give reasons why these
-- new tests are likely to be superior in practice.

sqrt''' x = until statis improve x
    where statis y = abs (y^2 - x) < eps * abs y^2
          improve y = (y + x/y) / 2
          eps = 0.001

