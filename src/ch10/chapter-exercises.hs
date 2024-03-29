module Ch10.ChapterExercises where

stops = "pbtdkg"
vowels = "aeiou"

f1 = [(s, v, s') | s <- stops, v <- vowels, s' <- stops]
f2 = [(s, v, s') | s <- stops, v <- vowels, s' <- stops, s == 'p']

nouns = ["Edoardo", "book", "tv", "guitar"]
verbs = ["plays", "reads", "watches"]

f4 = [(n, v, n') | n <- nouns, v <- verbs, n' <- nouns, n == "Edoardo", n' /= "Edoardo"]

-- this fn calculates the average length of each word in x
seekritFunc x = div (sum (map length (words x))) (length (words x))

seekritFunc' x = (/) (fromIntegral (sum (map length (words x)))) (fromIntegral (length (words x)))

myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x y -> f x || y) False

myElem :: Eq a => a -> [a] -> Bool
myElem a = myAny (== a)

myElem' :: Eq a => a -> [a] -> Bool
myElem' a = foldr (\x _ -> a == x) False

myReverse :: [a] -> [a]
myReverse = foldr (\x y -> y ++ [x]) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x y -> f x:y) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x y -> if f x then x:y else y) []

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x y -> f x ++ y) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "empty list"
myMaximumBy f (a:as) = foldl (\x y -> case f x y of
  GT -> x
  _  -> y) a as

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "empty list"
myMinimumBy f (a:as) = foldl (\x y -> case f x y of
  GT -> y
  _  -> x) a as