module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Leaf | Node (BST a) a (BST a)
  deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Leaf = Nothing
bstLeft (Node l _ _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Leaf = Nothing
bstRight (Node _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue Leaf = Nothing
bstValue (Node _ val _) = Just val 

empty :: BST a
empty = Leaf

fromList :: Ord a => [a] -> BST a
fromList lst = foldl (\tree item -> insert item tree) Leaf lst

insert :: Ord a => a -> BST a -> BST a
insert x Leaf = singleton x
insert x (Node l val r)
  | x <= val = Node (insert x l) val r
  | x > val = Node l val (insert x r)

singleton :: a -> BST a
singleton val = Node Leaf val Leaf

toList :: BST a -> [a]
toList Leaf = []
toList (Node l val r) = toList l ++ [val] ++ toList r
