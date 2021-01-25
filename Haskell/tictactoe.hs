-- Tic-tac-toe game, inspired by "Programming in Haskell" (2dn Ed) by Hutton

import Text.Read

size :: Int
size = 3

data Player = O | X | Blank
    deriving (Eq, Ord, Show)

type Grid = [[Player]]

next :: Player -> Player
next O = X
next X = O
next _ = Blank

empty :: Grid
empty = replicate size (replicate size Blank)

allSame :: Eq a => [a] -> Bool
allSame lst = and (map (== (head lst)) lst)

rowWin :: Grid -> Player
rowWin [] = Blank
rowWin grid = if (\ row -> allSame row) row
              then (head row)
              else rowWin (tail grid)
    where row = head grid

colWin :: Grid -> Player
colWin grid = rowWin (transpose grid)

diag :: [[a]] -> [a]
diag arr = zipWith (!!) arr [0..]

diagWin :: Grid -> Player
diagWin grid = if (allSame (diag grid))
               then grid !! 0 !! 0
               else diagWin (reverse g)

findWinner :: [(Grid -> Player)] -> Grid -> Player
findWinner criteria grid = if result /= Blank
                           then result
                           else findWinner (tail criteria) grid
    where result = (head criteria) grid

wins = findWinner [rowWin, colWin, diagWin]

insertAt :: Int -> a -> [a] -> [a] 
insertAt _ _ [] = []
insertAt i val lst = if i == (length lst)
                     then (init lst) ++ [val]
                     else (fst parts) ++ [val] ++ (tail (snd parts))
    where parts = splitAt i lst

insert :: Int -> Int -> a -> [[a]] -> [[a]]
insert i j val arr = before ++ [changed] ++ after
    where row_split = splitAt i arr
          before = fst row_split
          changed = insertAt j val (head (snd row_split))
          after = tail (snd row_split)

checkValidInt :: String -> Bool
checkValidInt strInt =
  case (readMaybe strInt :: Maybe Int) of
    Nothing -> False
    Just _  -> True     

prompt :: IO (Int, Int)
prompt =
    do putStr "x: "
       x <- getLine
       putStr "y: "
       y <- getLine
       if (checkValidInt x) && (checkValidInt y)
       then return ((read x :: Int), (read y :: Int))
       else prompt




nextMove :: Grid -> Int -> Int -> Player -> Grid
nextMove grid i j player = if (grid !! i !! j) == Blank
                           then insert i j player grid
                           else -- ???