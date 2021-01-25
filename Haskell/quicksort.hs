
partition :: Ord a => [a] -> a -> [a] -> [a] -> ([a], [a])
partition [] pivot lo hi = (lo, hi)
partition (x:xs) pivot lo hi = if x < pivot
                               then partition xs pivot (x:lo) hi
                               else partition xs pivot lo (x:hi)

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort lst = (quicksort (fst part)) ++ [pivot] ++ (quicksort (snd part))
  where pivot = last lst
        part = partition (init lst) pivot [] []
