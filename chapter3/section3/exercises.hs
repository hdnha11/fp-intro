import Data.List

main = putStrLn "Section 3.3 Operations on lists"

l1 = [1, 2, 3] ++ [4, 5]
l2 = [1, 2] ++ [] ++ [1]

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

l3 = Main.concat [[1, 2], [], [3, 2, 1]]
l4 = Main.concat ["We", " ", "like", " ", "lists."]

l5 = head [1, 2, 3, 4, 5]
l6 = tail [1, 2, 3, 4, 5]
l7 = init [1, 2, 3, 4, 5]
l8 = last [1, 2, 3, 4, 5]

l9 = take 3 [1..10]
l10 = take 3 [1..2]
l11 = drop 3 [1..10]
l12 = drop 3 [1..2]

l13 = takeWhile even [2, 4, 6, 1, 5, 6]
l14 = takeWhile even [1..100]
l15 = takeWhile (== 'a') "aardvark"
l16 = dropWhile even [2, 4, 6, 1, 5, 6]
l17 = dropWhile even [1..100]
l18 = dropWhile (== 'a') "aardvark"

l19 = reverse "Richard Bird"
l20 = reverse "Madam, I'am Adam."

l21 = zip [0..4] "hallo"
l22 = zip [0..1] "hallo"

-- Scala product
sp (xs, ys) = sum [x * y | (x, y) <- zip xs ys]

sp' = sum . zipwith (*)

zipwith f (xs, ys) = [f x y | (x, y) <- zip xs ys]

-- Non-decreasing sequences
nondec xs = and [x <= y | (x, y) <- zip xs (tail xs)]

-- Position
position :: Eq a => [a] -> a -> Int
positions xs x = [i | (i, y) <- zip [0..length xs - 1] xs, x == y]
position xs x = head (positions xs x ++ [-1])

i1 = [2, 4, 6, 8]!!2
i2 = [2, 4, 6, 8]!!0

-- We can define indexing with zip
xs ! n = head [y | (i, y) <- zip [0..length xs - 1] xs, i == n]

i3 = [2, 4, 6, 8]!2
i4 = [2, 4, 6, 8]!0

nondec' xs = and [xs!k <= xs!(k + 1) | k <- [0..length xs - 2]]

l23 = [1, 2, 1, 3, 1, 3] \\ [1, 3]
l24 = ("angle" \\ "l") ++ "l"

permutation xs ys = (xs \\ ys == []) && (ys \\ xs == [])

-- Exercises

-- 3.3.1 Express #[e | x <- xs, y <- ys] in terms of #xs and #ys.

-- #[e | x <- xs, y <- ys] = #xs x #ys

-- 3.3.2 Which of the following equations are true and which are false?
-- [[]] ++ xs = xs (False)
-- [[]] ++ xs = [xs] (False)
-- [[]] ++ xs = [[], xs] (False)
-- [[]] ++ [xs] = [[], xs] (True)
-- [xs] ++ [] = [xs] (True)
-- [xs] ++ [xs] = [xs, xs] (True)

-- 3.3.3 Give an informal characterisation of those finite lists xs and ys which satisfy:
-- xs ++ ys = ys ++ xs

-- They contain the same element

-- 3.3.4 What is the value of [head xs] ++ tail xs when xs = []?

-- [head xs] ++ tail xs == bottom

-- 3.3.5 Show, using an informal argument, that if p is the minimum of m and n, then:
-- take m . take n = take p

-- If n > m then it will take n element then take m element from previous result
-- If n < m then it will take n element then take n element (m > n so it will take all)
-- => take m . take n = take (min m n) = take p

-- 3.3.6 Verify or disprove the assertion that:

-- (drop n xs)!m = xs!(n + m)

-- for all finite lists xs and natural numbers n and m.

-- It's correct

-- 3.3.7 Is zip associative in the sense that:
-- zip (xs, zip (ys, zs)) = zip (zip (xs, ys), zs)
-- for all xs, ys and zs?

-- No, it's not

-- 3.3.8 Using zip define the function zip4 which converts a 4-tuple of lists into a list of 4-tuples.

zip4 (as, bs, cs, ds) = [(a, b, c, d) | ((a, b), (c, d)) <- zip (zip as bs) (zip cs ds)]

-- 3.3.9 Define a function trips so that trips xs returns a list of all adjacent triples of elements of xs.

trips xs = [(xs!!i, xs!!(i + 1), xs!!(i + 2)) | i <- [0, 3..(length xs) - 3]]

-- 3.3.10 Suppose a list xs of integers contains an equal number of odd and even numbers. Define a function riffle so that (riffle xs) is some rearrangement of xs in which odd and even numbers alternate.

riffle xs = Main.concat [[a, b] | (a, b) <- zip os es]
  where es = [e | e <- xs, even e]
        os = [o | o <- xs, odd o]

-- 3.3.11 Find xs and ys such that:
-- (xs ++ ys) \\ ys /= xs

-- xy = [1,2]
-- xs = yx ++ [3]

-- 3.3.12 In a version of the game Mastermind, one player thinks of an n-digit number, while the other player repeatedly tries to guess it. After each guess, player 1 scores the guess by stating the number of bulls and cows. A bull is a correct digit in the correct place. A cow is a digit appearing in the secret number, but not in the correct place. No digit is scored more than once. For example, if the secret code is 2113, then:
-- 1234 scores 03
-- 1111 scores 20
-- 1212 scores 12
-- Using (\\), construct a function score which takes a code and a guess and returns the number of bulls and cows.

numberToArray n
  | n == 0 = []
  | otherwise = numberToArray (n `div` 10) ++ [n `mod` 10]

digits n
  | n == 0 = [0]
  | otherwise = numberToArray n

bulls n g = [x | (x, y) <- zip (digits n) (digits g), x == y]

cows n g = gs \\ (b ++ w)
    where ns = digits n
          gs = digits g
          n1 = ns \\ b
          guess1 = gs \\ b
          b = bulls n g
          w = guess1 \\ n1

score n guess = (length (bulls n guess), length (cows n guess))
