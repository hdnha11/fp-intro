main = putStrLn "Section 2.5 Patterns"

cond True x y = x
cond False x y = y

cond' p x y
  | p == True = x
  | p == False = y

a :: Bool -> Bool -> Bool
True `a` x = x
False `a` x = False

o :: Bool -> Bool -> Bool
True `o` x = True
False `o` x = x

permute 0 = 1
permute 1 = 2
permute 2 = 3

permute' n
  | n == 0 = 1
  | n == 1 = 2
  | n == 2 = 3

-- Not supported in Haskell
-- pred 0 = 0
-- pred (n + 1) = n

-- count 0 = 0
-- count 1 = 1
-- count (n + 2) = 2

-- Exercises

-- 2.5.1 Define versions of the functions (a) and (o) using patterns for the second argument. Define versions which use patterns for both arguments. Draw up a table showing the values of and and or for each version.

x `a'` True = x
x `a'` False = False

x `o'` True = True
x `o'` False = x

x `a''` y = x && y

x `o''` y = x || y

-- 2.5.2 Is the definition of pred given in the text equivalent to the following one?
pred n
  | n == 0 = 0
  | n > 0 = n - 1
-- Yes
