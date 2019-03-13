main = putStrLn "Section 3.4 Map and filter"

square x = x * x

l1 = map square [9, 3]
s = sum (map square [1..100])

sigma f m n = sum (map f [m..n])
sumsquares = sigma square 1 100

l2 = filter even [1, 2, 3, 4, 5, 32]
l3 = (sum . map square . filter even) [1..10]

rule1 xs = [x | x <- xs] -- xs
rule2 f xs = [f x | x <- xs] -- map f xs
rule3 p xs = [1 | x <- xs, p x] -- [1 | x <- filter p xs]
rule4 xs ys = [1 | x <- xs, y <- ys] -- concat [[1 | y <- ys] | x <- xs]

-- const k x = k
-- [1 | x <- xs] = [const 1 x | x <- xs] (const.1)
--               = map (const 1) xs (Rule 2)
l4 = map (const 1) [1..10]

-- [x | x <- xs, x == min xs] = [x | x <- xs, minof xs x] (minof.1)
--                            = [x | x <- filter (minof xs) xs] (Rule 3)
--                            = filter (minof xs) xs (Rule 1)
minof xs x = x == minimum xs

l5 = filter (minof [1..10]) [1..10]

-- Exercises

-- 3.4.1 The function filter can be defined in terms of concat and map:
-- filter p = concat . map box
--     where box x = ...
-- Give the definition of box.

filter' p = concat . map box
    where box x = if p x then [x] else []

-- 3.4.2 What is the type of (map map)?

-- map :: (a -> b) -> [a] -> [b]
-- (map map) :: [a -> b] -> [[a] -> [b]]

-- 3.4.3 Using the rules given in Section 3.4, convert the following expressions
-- into combinations of map, filter and concat:
-- [x | xs <- xss, x <- xs, odd x]
-- [(x, y) | x <- xs, p x, y <- ys]

-- [x | xs <- xss, x <- xs, odd x] = concat [[x | x <- xs, odd x] | xs <- xss] (Rule 4)
--                                 = concat [[x | filter odd xs] | xs <- xss] (Rule 3)
--                                 = concat [filter odd xs | xs <- xss] (Rule 1)
--                                 = concat (map (filter odd) xss) (Rule 2)

-- [(x, y) | x <- xs, p x, y <- ys] = [(x, y) | x <- filter p xs, y <- ys] (Rule 3)
--                                  = concat [[(x, y) | y <- ys] | x <- filter p xs] (Rule 4)

-- 3.4.4 Consider the following two expressions:
-- [(x, y) | x <- xs, p x, y <- ys]
-- [(x, y) | x <- xs, y <- ys, p x]

-- Are they equivalent? Supposing #xs = 1000, #(filter p xs) = 10 and #ys = 100,
-- compare the costs of evaluating the two expressions. What conclusions do you draw?

-- They are equivalent.
-- The second expression is more expensive to evaluate than the first one.
-- We should filter as soon as posible right after its generator
