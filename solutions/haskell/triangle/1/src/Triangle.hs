module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | a<=0 || ca > b || ab > c || bc > a = Illegal
  | a == b && b == c = Equilateral
  | ca * ab * bc == 0 = Isosceles
  | otherwise = Scalene
  where
    ca=c-a; ab=a-b; bc=b-c
