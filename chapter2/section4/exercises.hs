main = putStrLn "Section 2.4 Tuples"

-- fst :: (a, b) -> a
-- fst (x, y) = x

-- snd :: (a, b) -> b
-- snd (x, y) = y

fst3 (x, y, z) = x
snd3 (x, y, z) = y
thd3 (x, y, z) = z

quotrem :: Integral num => (num, num) -> (num, num)
quotrem (x, y) = (x `div` y, x `mod` y)

roots :: (Ord num, Floating num) => (num, num, num) -> (num, num)
roots (a, b, c)
  | d >= 0 = (r1, r2)
  where r1 = ((-b) + r) / (2 * a)
        r2 = ((-b) - r) / (2 * a)
        r = sqrt d
        d = b^2 - 4 * a * c

radd (x, y) (u, v) = norm (x * v + u * y, y * v)
rsub (x, y) (u, v) = norm (x * v - u * y, y * v)
rmul (x, y) (u, v) = norm (x * u, y * v)
rdiv (x, y) (u, v) = norm (x * v, y * u)

norm (x, y)
  | y /= 0 = (u `div` d, v `div` d)
  where u = (sign y) * x
        v = abs y
        d = gcd (abs u) v

sign x
  | x > 0 = 1
  | x < 0 = -1
  | otherwise = 0

compare op (x, y) (u, v) = op (x * v) (y * u)

requals = Main.compare (==)
rless = Main.compare (<)
rgreater = Main.compare (>)

showrat (x, y)
  | v == 1 = show u
  | otherwise = show u ++ "/" ++ show v
  where (u, v) = norm (x, y)

-- Exercises

-- 2.4.1 Suppose a date is represented by a triple (d, m, y) of three integers, where d is the day, m is the month, and y the year. Define a function age which takes two dates, the first being the birthdate of some individual P and the second the current date, and returns the age of P as a whole number of years.

age (d, m, y) (cd, cm, cy)
  | isBeforeCurrentDate = cy - y + addition
  where isBeforeCurrentDate = cy > y || (cy == y && cm > m) || (cy == y && cm == m && cd >= d)
        addition
          | cm > m = 1
          | cm == m && cd >= d = 1
          | otherwise = 0

-- 2.4.2 For a given integer x, let (y,z) be a pair of integers such that: (i) abs (y) <= 5; (ii) x = y + 10 * z; and (iii) z is the number of smallest absolute value which satisfies (i) and (ii). Show that y and z are uniquely determined by these conditions, and define a function split so that split x = (y, z).

split x
  | r <= 5 = (r, d)
  | otherwise = (r - 10, d + 1)
  where d = x `div` 10
        r = x `mod` 10
