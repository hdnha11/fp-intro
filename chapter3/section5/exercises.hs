main = putStrLn "Section 3.5 The fold operators"

sum' xs = foldr (+) 0 xs
product' xs = foldr (*) 1 xs
concat' xs = foldr (++) [] xs
and' xs = foldr (&&) True xs
or' xs = foldr (||) False xs

length' xs = foldr oneplus 0 xs
    where oneplus x n = 1 + n

reverse' xs = foldr postfix [] xs
    where postfix x xs = xs ++ [x]

takeWhile' p xs = foldr pick [] xs
    where pick x xs
            | p x = [x] ++ xs
            | otherwise = []

pack xs = foldl f 0 xs
    where f n x = 10 * n + x


length'' xs = foldl plusone 0 xs
    where plusone n x = n + 1

reverse'' xs = foldl prefix [] xs
    where prefix xs x = [x] ++ xs

prefix xs x = [x] ++ xs

cons x xs = [x] ++ xs

f1 xs = xs == foldr cons [] xs

f2 xs = foldr cons [] xs == foldl prefix [] (reverse xs)

maxnaturals xs = foldr max 0 xs

maximum' xs = foldl1 max xs

foldl1' fn xs = foldl fn (head xs) (tail xs)

foldr1' fn xs = foldr fn (last xs) (init xs)

l1 = scanl (+) 0 [1, 2, 3, 4, 5]

l2 = scanl (*) 1 [1, 2, 3, 4, 5]

-- Exercises

-- 3.5.1 Consider the function all which takes a predicate p and a list xs and returns True if all elements of xs satisfy p, and False otherwise. Give a formal definition of all which uses foldr.

all' p xs = foldr check True xs
    where check x y = p x && y

-- 3.5.2 Which, if any, of the following equations are true?
--     foldl (-) x xs = x - sum xs
--     foldr (-) x xs = x - sum xs

--     foldl (-) x xs = x - sum xs (True)
--     foldr (-) x xs = x - sum xs (False)

-- 3.5.3 Verify the equation:
--     foldl fn a (xs ++ ys) = foldl fn (foldl fn a xs) ys
-- Using the fact that:
--     reverse (xs ++ ys) = reverse ys ++ reverse xs
-- and one of the duality laws, derive a similar equation for foldr fn a (xs ++ ys).

-- 3.5.4 Consider the following definition of a function insert:
--     insert x xs = takewhile (<=x) xs ++ [x] ++ dropwhile (<=x) xs
-- Show that if xs is a list in non-decreasing order, then so is (insert x xs). Using insert, define a function isort for sorting a list into non-decreasing order.

insert x xs = takeWhile (<=x) xs ++ [x] ++ dropWhile (<=x) xs

isort xs = foldr insert [] xs

-- 3.5.5 The function remdups removes adjacent duplicates from a list. For example, remdups [1,2,2,3,3,3,1,1] = [1,2,3,1]. Define remdups using either foldl or foldr.

remdups xs = foldl add [] xs
    where add xs x
            | length xs > 0 && last xs == x = xs
            | otherwise = xs ++ [x]

-- 3.5.6 Given a list xs = [x1, x2, ..., xn] of numbers, the sequence of successive maxima (ssm xs) is the longest subsequence [xj1, xj2, , ..., xjm] such that j1 = 1 and xj < xjk for j < jk. For example, the sequence of successive maxima of [3,1,3,4,9,2,10,7] is [3,4,9,10]. Define ssm in terms of foldl.

-- 3.5.7 The following law relates foldl and map:
--     foldl fn a . map f = foldl fn a
-- where x fn1 y = x fn f y. Derive this law from the corresponding law relating foldr and map, using the fact that:
--     map f . reverse = reverse · map f
-- and one of the duality theorems.

-- 3.5.8 Define the functions foldr1 and scan1 that relate to foldr and scan analogously to the way that foldl1 relates to foldl.

-- 3.5.9 The mathematical constant e is defined by:
--     e = sum (1/n!), where n >= 0
-- Write down an expression that can be used to evaluate e to some reasonable measure of accuracy.
