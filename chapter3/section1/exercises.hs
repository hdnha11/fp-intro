main = putStrLn "Section 3.1 List notation"

-- [a..b] = [a, a + 1, a + 2, ..., b - 1, b]
-- [a, b..c] = [a, a + d, a + 2 * d, ...] where d = b - a

l1 = [1, 2, 3] :: [Int]
l2 = ['h', 'a', 'l', 'l', 'o'] :: [Char]
l3 = [[1, 2], [3]] :: [[Int]]
l4 = [(+), (*)] :: [Int -> Int -> Int]

fives = [1..5]
evens = [2, 4..10]

nums = [[], [1], [], [2]]
chars = ["hello", [], "world", []]

-- Exercises

-- 3.1.1 Give an example of an expression which contains two occurrences of the empty list, the first occurrence having type [num] and the second type [char].

names = [] :: [[Int]]
olds = [] :: [[Char]]
students = (names, olds)

-- 3.1.2 Determine the number of elements of [a..b] and [a, b..c] in terms of a, b and c.

len1 a b = b - a + 1

len2 a b c = n + 2
    where d = b - a
          n = (c - b) `div` d

