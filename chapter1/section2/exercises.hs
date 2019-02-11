main = putStrLn "Section 1.2"

-- Exercises
-- 1.2.1 Count the number of different ways that:
--          square (square (3 + 7))
-- can be reduced to normal form.

-- 1) square (square (3 + 7)) => square (3 + 7) x square (3 + 7) (square)
--                            => (3 + 7) x (3 + 7) x square (3 + 7) (square)
--                            => (3 + 7) x (3 + 7) x (3 + 7) x (3 + 7) (square)
--                            => 10 x (3 + 7) x (3 + 7) x (3 + 7) (+)
--                            => 10 x 10 x (3 + 7) x (3 + 7) (+)
--                            => 10 x 10 x 10 x (3 + 7) (+)
--                            => 10 x 10 x 10 x 10 (+)
--                            => 100 x 10 x 10 (x)
--                            => 1000 x 10 (x)
--                            => 10000 (x)

-- 2) square (square (3 + 7)) => square (square 10) (+)
--                            => square (10 x 10) (square)
--                            => square (100) (x)
--                            => 100 x 100 (square)
--                            => 10000 (x)

-- 1.2.2 Consider the definition:
--          three x = 3
-- In how many ways can three (3 + 4) be reduced to normal form?

-- 1) three (3 + 4) => 3 (three)

-- 2) three (3 + 4) => three 7 (+)
--                  => 3 (three)

-- 1.2.3 Imagine a language of expressions for representing integers defined by the syntax rules: (i) zero is an expression; (ii) if e is an expression, then so are (succ e) and (pred e). An evaluator reduces expressions in this language by applying the following rules repeatedly until no longer possible:
--          (succ (pred e)) => e (succ.l)
--          (pred (succ e)) => e (pred.1)
-- Simplify the expression
--          (succ (pred (succ (pred (pred zero)))))
-- In how many ways can the reduction rules be applied to this expression? Do they all lead to the same final result? Prove that the process of reduction must terminate for all given expressions. (Hint: Define an appropriate notion of expression size, and show that reduction does indeed reduce size.)
-- Suppose an extra syntactic rule is added to the language: (iii) if e1 and e2 are expressions, then so is (add e1 e2). The corresponding reduction rules are:
--          (add zero e2) => e2 (add.l)
--          (add (succ e1) e2) => (succ (add e1 e2)) (add.2)
--          (add (pred e1) e2) => (pred (add e1 e2)) (add.3)
-- Simplify the expression:
--          (add (succ (pred zero)) zero).
-- Count the number of different ways the reduction rules can be applied to the above expression. Do they always lead to the same final result? Prove that the the process of reduction must always terminate for any given initial expression. (Hint: Extend the notion of expression size.)

-- 1) (succ (pred (succ (pred (pred zero))))) => (succ (pred (pred zero))) (sucs.1)
--                                         => (pred zero) (sucs.1)
--                                         => -1 (pred)

-- 2) (succ (pred (succ (pred (pred zero))))) => (succ (pred (succ (pred -1)))) (pred)
--                                         => (succ (pred  -1)) (sucs.1)
--                                         => -1 (sucs.1)

-- 1) (add (succ (pred zero)) zero) => (succ (pred zero)) (add.1)
--                                  => (succ (pred zero)) (add.1)
--                                  => zero (succ.1)

-- 2) (add (succ (pred zero)) zero) => (add (succ (pred zero)) zero) (add.1)
--                                  => (add zero zero) (succ.1)
--                                  => zero (add.1)

-- 1.2.4 Imagine a language of finite sequences of 0 and 1. The rules for simplifying strings in this language are given by:
--          1??x => x1101
--          O??x => xOO
-- In these rules, the variable x denotes an arbitrary sequence of Os and 1s and the sign '?' denotes a single 0 or 1. Reduce the following expressions to canonical form:
--          1110    10    1110100
-- Construct an expression for which the reduction process does not terminate. (Such a system of reduction rules is known as a Post Normal System; see Minsky [1] for further details. Although it is easy to construct strings that 'loop', it is an open problem whether or not there is an initial string on which the above system fails to terminate by producing an infinite number of successively larger strings.)

-- 1110101110100 => 01011101001101
--               => 1110100110100
--               => 01001101001101
--               => 0110100110100
--               => 010011010000
--               => 01101000000
--               => 0100000000
--               => 00000000
--               => 0000000
--               => 000000
--               => 00000
--               => 0000
--               => 00
