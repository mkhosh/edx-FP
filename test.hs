main :: IO () 
main = print (fac 5)

fac :: (Num t, Eq t) => t -> t
fac 0 = 1 
fac n = n * fac (n-1)

twice f x = f (f x)
