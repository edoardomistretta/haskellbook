module Ch11.Vehicles where

data Price = Price Integer deriving (Eq, Show)

data Manufacturer =
  Mini |
  Mazda |
  Tata
  deriving (Eq, Show)

data Airline =
  PapuAir |
  CatapultsR'Us |
  TakeYourChancesUnited
  deriving (Eq, Show)

data Vehicle =
  Car Manufacturer Price |
  Plane Airline
  deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

-- 1. :t myCar :: Vehicle

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m
getManu _ = undefined

-- rewriting Vehicle with Size for Plane
data Size = Size Integer deriving (Eq, Show)
data Vehicle' =
  Car' Manufacturer Price |
  Plane' Airline Size
  deriving (Eq, Show)

doge' = Plane' PapuAir (Size 100000)

isCar' :: Vehicle' -> Bool
isCar' (Car' _ _) = True
isCar' _ = False

isPlane' :: Vehicle' -> Bool
isPlane' (Plane' _ _) = True
isPlane' _ = False

areCars' :: [Vehicle'] -> [Bool]
areCars' = map isCar'

getManu' :: Vehicle' -> Manufacturer
getManu' (Car' m _) = m
getManu' _ = undefined

getSize' :: Vehicle' -> Size
getSize' (Plane' _ s) = s
getSize' _ = undefined
