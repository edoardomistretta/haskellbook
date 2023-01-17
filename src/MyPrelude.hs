{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module MyPrelude where

import Prelude hiding (foldl)

-- same as head
myHead :: [a] -> a
myHead (a:_) = a

-- same as last
myLast :: [a] -> a
myLast [a] = a
myLast (_:as) = myLast as

-- same as tail
myTail :: [a] -> [a]
myTail (_:as) = as

-- same as (++)
(+++) :: [a] -> [a] -> [a]
(+++) [] b = b
(+++) (a:as) b = a : (as +++ b)

-- same as init
myInit :: [a] -> [a]
myInit [_] = []
myInit (a:as) = a:myInit as

-- same as (!!)
(!!!) :: [a] -> Int -> a
(!!!) (a:_) 0 = a
(!!!) (_:as) b = as !!! (b - 1)

-- same as null
myNull :: [a] -> Bool
myNull [] = True
myNull _ = False

-- same as length
myLength :: [a] -> Int
myLength [] = 0
myLength a = go a 0
  where
    go [_] len = len + 1
    go (_:as) len = go as (len + 1)

-- same as reverse
myReverse :: [a] -> [a]
myReverse = go []
  where
    go acc [] = acc
    go acc (x:xs) = go (x:acc) xs

-- same as map
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (a:as) = f a:myMap f as

--same as filter
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (a:as)
  | toBeFiltered = a:myFilter f as
  | otherwise = myFilter f as
  where toBeFiltered = f a

-- same as take
myTake :: Int -> [a] -> [a]
myTake 0 _ = []
myTake n (a:as) = a:myTake (n - 1) as

-- same as drop
myDrop :: Int -> [a] -> [a]
myDrop 0 a = a
myDrop n (_:as) = myDrop (n - 1) as

-- same as splitAt
mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt 0 as = ([], as)
mySplitAt n (a:as) = (a:fst nextSplit, snd nextSplit)
  where nextSplit = mySplitAt (n - 1) as

-- same as takeWhile
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile f (a:as)
  | fa = a:myTakeWhile f as
  | otherwise = []
  where fa = f a

-- same as dropWhile
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile f (a:as)
  | fa = myDropWhile f as
  | otherwise = a:as
  where fa = f a

-- same as elem
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem v (a:as)
  | v == a = True
  | otherwise = myElem v as

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (a:as) (b:bs) = (a, b):(myZip as bs)

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (a:as) (b:bs) = f a b:myZipWith f as bs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f i [] = i
myFoldr f i (a:as) = f a (myFoldr f i as)

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f i [] = i
myFoldl f i (a:as) = f (myFoldl f i as) a