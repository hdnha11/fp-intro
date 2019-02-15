main = putStrLn "Section 3.2 List comprehensions"

evenSqures = [x * x | x <- [1..10], even x]

l1 = [(a, b) | a <- [1..3], b <- [1..2]]
l2 = [(a, b) | b <- [1..2], a <- [1..3]]

l3 = [(i, j) | i <- [1..4], j <- [i + 1..4]]

l4 = [(i, j) | i <- [1..4], even i, j <- [i + 1..4], odd j]

pairs = [(i, j) | i <- [1..2], j <- [1..3]]

l5 = [i + j | (i, j) <- pairs]

l6 = [3 | j <- [1..4]]

l7 = [x | x <- [1..3], y <- [1, 2]]

spaces n = [' ' | j <- [1..n]]

divisors n = [d | d <- [1..n], n `mod` d == 0]

gcd a b = maximum [d | d <- divisors a, b `mod` d == 0]

-- maximum = foldl1 max

prime n = (divisors n == [1, n])

prime' n = n > 1 && [d | d <- [2..intsqrt n], (round n) `mod` d == 0] == []

intsqrt :: Double -> Int
intsqrt n = floor (sqrt n)

triads n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x ^ 2 + y ^ 2 == z ^ 2]
triads' n = [(x, y, z) | x <- [1..n], y <- [x..n], z <- [y..n], x ^ 2 + y ^ 2 == z ^ 2]

-- Exercises

-- 3.2.1 Evaluate the expression:
-- [j | i <- [1, -1, 2, -2], i > 0, j <- [1..i]]

-- [1, 1, 2]

-- 3.2.2 Under what conditions on xs and ys does the equation:
-- [x | x <- xs, y <- ys] == [x | y <- ys, x <- xs]
-- hold?

-- xs = [] or every item in xs has same value

-- 3.2.3 Using a list comprehension, define a function for counting the number of negative numbers in a list.

countNegative xs = length [x | x <- xs, x < 0]

-- 3.2.4 Define a function intpairs so that (intpairs n) is a list of all distinct pairs ofintegers 1 <= x, y <= n.

intpairs n = [(x, y) | x <- [1..n], y <- [x..n]]

-- 3.2.5 Write a program to find all quadruples (a, b, c, d) in the range 0 < a, b, c, d <= n such that a^2 + b^2 = c^2 + d^2.

quadruples n = [(a, b, c, d) | a <- [1..n], b <- [1..n], c <- [1..n], d <- [1..n], a ^ 2 + b ^ 2 == c ^ 2 + d ^ 2]

-- 3.2.6 Define x^n using a list comprehension.

power x n = product [x | j <- [1..n]]

-- product = foldl1 (*)

-- 3.2.7 Determine the value of (divisors 0), where:
-- divisors n = [d | d <- [1..n], n `mod` d == 0]
-- divisors 0 == []

-- 3.2.8 Define a function mindivisor which returns the smallest divisor, greater than 1, of a given positive integer. Using mindivisor, construct a function for testing whether a number is prime.

mindivisor n = minimum [x | x <- divisors n, x > 1]
prime'' n = n > 1 && mindivisor n == n

-- 3.2.9 Define gcd to allow for zero arguments.

gcd' a b
  | a == 0 || b == 0 = max a b
  | otherwise = maximum [d | d <- divisors a, b `mod` d == 0]

-- 3.2.10 Show that if n has a divisor in the range 1 < d < n, then it has one in the range 1 < d <= sqrt n.

-- n = a.b
-- if a > sqrt n then b < sqrt n otherwise a.b > n
-- special case is a = b = sqrt n
