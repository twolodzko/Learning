order x y = if x < y then (x, y) else (y, x)

sortStep left right = if (length right) > 1
                      then sortStep (left' ++ [snd sorted]) (tail right)
                      else (left', [snd sorted])
  where sorted = order (last left) (head right)
        left' = (init left) ++ [fst sorted]

bubbleSort (x:xs) = if xs == []
                    then [x]
                    else (bubbleSort (fst step)) ++ (snd step)
  where step = sortStep [x] xs
