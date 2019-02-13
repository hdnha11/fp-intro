main = putStrLn "Section 2.7 Type synonyms"

type Position = (Float, Float)
type Angle = Float
type Distance = Float

move :: Distance -> Angle -> Position -> Position
move d a (x, y) = (x + d * cos a, y + d * sin a)

-- move (sqrt 2) (45 * pi / 180) (1, 1)

type Pairs a = (a, a)
type Automorph a = a -> a
