main = putStrLn "Section 2.8 Type inference"

-- Rules:

-- (i) (Application rule) If f x :: t, then x :: t' and f :: t' -> t for some new type t';

-- (ii) (Equality rule) If both the types x :: t and x :: t' can be deduced for a variable x, then t = t';

-- (iii) (Function rule) If t -> u = t' -> u', then t = t' and u = u'.

-- (.) :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
(.) f g x = f (g x)

-- f :: Num a => (a, b1) -> (a, b2) -> a
f x y = fst x + fst y

-- fix :: (t -> t) -> t
fix f = f (fix f)

-- Wrong type
-- selfapply f = f f

-- Exercises

-- 2.8.1 Suppose the functions const, subst and fix are defined by the equations:

-- const x y = x
-- subst f g x = f x (g x)
-- fix f x = f (fix f) x

-- x :: t1
-- y :: t2
-- const :: t1 -> t2 -> t1
const :: a -> b -> a
const x y = x

-- f :: t1
-- g :: t2
-- x :: t3
-- f x (g x) :: t4
-- subst :: t1 -> t2 -> t3 -> t4
-- f x (g x) :: t4
-- x :: t6
-- g x :: t7
-- f :: t6 -> t7 -> t4
-- g x :: t7
-- x :: t8
-- g :: t8 -> t7
-- t1 = t6 -> t7 -> t4
-- t2 = t8 -> t7
-- t3 = t6 = t8
-- subst :: (t6 -> t7 -> t4) -> (t8 -> t7) -> t3 -> t4
-- subst :: (t3 -> t7 -> t4) -> (t3 -> t7) -> t3 -> t4
subst :: (a -> b -> c) -> (a -> b) -> a -> c
subst f g x = f x (g x)

-- f :: t1
-- x :: t2
-- f (fix' f) x :: t3
-- fix' :: t1 -> t2 -> t3
-- f (fix' f) x :: t3
-- (fix' f) :: t4
-- x :: t5
-- f :: t4 -> t5 -> t3
-- fix' f :: t4
-- f :: t6
-- fix' :: t6 -> t4
-- t1 = t6 = t4 -> t5 -> t3
-- t2 = t5
-- t1 -> t2 -> t3 = t6 -> t4 => t6 = t1 && t4 = t2 -> t3
-- fix' :: ((t5 -> t3) -> t5 -> t3) -> t5 -> t3
fix' :: ((a -> b) -> a -> b) -> a -> b
fix' f x = f (fix' f) x

-- Deduce their types.

-- 2.8.2 Show that the identity function id is equal to (subst const const), where subst and const are as defined in the previous question. The function compose can also be expressed in terms of these functions. How?

-- subst const const x = const x (const x)
--                     = x
--                     = id x

-- 2.8.3 Define the function apply which applies its first argument to its second. What is its type? What is the relationship between apply and id?

-- apply f x = f x
-- f :: t1
-- x :: t2
-- f x :: t3
-- apply :: t1 -> t2 -> t3
-- f x :: t3
-- x :: t4
-- f :: t4 -> t3
-- t1 = t4 -> t3
-- t2 = t4
-- apply :: (t4 -> t3) -> t4 -> t3
apply :: (a -> b) -> a -> b
apply f x = f x

-- 2.8.4 Suppose the function query is defined by:

-- query f x g = g f (f x g)

-- Is there a sensible type which can be assigned to this function? If not, explain why.
