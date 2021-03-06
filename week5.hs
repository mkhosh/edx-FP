main = print 2

factorial 0 = 1
factorial n = n * factorial (n-1)

factIter curr 0 = curr 
factIter curr n = factIter (curr * n) (n-1)

factorial2 n = factIter 1 n

myzip _ [] = []
myzip [] _ = []
myzip (x:xs) (y:ys) = (x,y) : myzip xs ys
  
mydrop 0 xs = xs
mydrop _ [] = []
mydrop n (_:xs) = mydrop (n-1) xs

[] +++ xs = xs
(x:xs) +++ ys = x: (xs +++ ys)

qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
                                             where
                                                  smaller = filter (<=x) xs
                                                  larger = filter (>x) xs
(|@) :: [a] -> Int -> a
(x:_) |@ 0 = x
(x:xs) |@ n = xs |@ (n-1)

isElem _ [] = False
isElem y (x:xs) = (x == y) || isElem y xs

isElem2 y xs = 
          case xs of
              [] -> False
              x:xs' -> x == y || isElem2 y xs'

testMerge = merge [2, 5, 6] [1, 3, 4] == [1, 2, 3, 4, 5, 6]

merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x < y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

msort [] = []
msort [x] = [x]
msort xs = merge (msort xs1) (msort xs2)
           where
             k = div (length xs) 2
             (xs1,xs2) = splitAt k xs
