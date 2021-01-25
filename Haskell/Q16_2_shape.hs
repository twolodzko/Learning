-- Q.16.2 from "Get Programming with Haskell" by Will Kurt

type Diameter = Float
type Side = Float
type ShortSide = Float
type LongSide = Float

data Circle = Circle Diameter deriving (Show)
data Square = Square Side deriving (Show)
data Rectangle = Rectangle ShortSide LongSide deriving (Show)

class Shape a where
   area :: a -> Float

instance Shape Circle where
   area (Circle r) = 3.14 * r * r

instance Shape Square where
   area (Square s) = s * s

instance Shape Rectangle where
   area (Rectangle a b) = a * b
