module Satellite (treeFromTraversals) where

import BinaryTree (BinaryTree(..))

treeFromTraversals :: Ord a => [a] -> [a] -> Maybe (BinaryTree a)
treeFromTraversals preorder inorder = if (valid preorder inorder)
    then Just (parseTree preorder inorder)
    else Nothing

parseTree :: Eq a => [a] -> [a] -> BinaryTree a
parseTree [] []  = Leaf
parseTree preorder inorder =
    let (top:preRest) = preorder
        (inLeft, _:inRight) = span (/= top) inorder
        (preLeft, preRight) = splitAt (length inLeft) preRest
    in Branch (parseTree preLeft inLeft) top (parseTree preRight inRight)

valid :: Eq a => [a] -> [a] -> Bool
valid x y
    | length x /= length y = False
    | otherwise = noDuplicates x && noDuplicates y && all (\i -> elem i x) y

noDuplicates :: Eq a => [a] -> Bool
noDuplicates [] = False
noDuplicates (fst:rest) = noDuplicatesOf fst rest

noDuplicatesOf :: Eq a => a -> [a] -> Bool
noDuplicatesOf _ [] = True
noDuplicatesOf item rest@(fst:rest2) = not (elem item rest) && noDuplicatesOf item rest2
