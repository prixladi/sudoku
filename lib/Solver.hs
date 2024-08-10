module Solver (Block, Sudoku (..), isValid, solve) where

import Data.List (find, transpose)
import Data.List.Split (chunksOf)
import Data.Maybe (catMaybes, fromJust, fromMaybe, isJust)
import Data.Set (fromList)

type Position = (Int, Int)

type Block = [Maybe Int]

newtype Sudoku = Sudoku [Block] deriving (Eq, Show)

solve :: Sudoku -> Maybe Sudoku
solve sudoku
  | (not . isSolvable) sudoku = Nothing
  | isSolved sudoku = Just sudoku
  | otherwise = fromMaybe Nothing (find isJust (solve <$> updatedSudokus))
  where
    emptyPos = fromJust (findEmptyPosition sudoku)
    updatedSudokus = [replaceOnPosition emptyPos (Just value) sudoku | value <- [1 .. 9]]

findEmptyPosition :: Sudoku -> Maybe Position
findEmptyPosition (Sudoku s) = f s 0
  where
    f [] _ = Nothing
    f (block : rest) y
      | isJust x = Just (fromJust x, y)
      | otherwise = f rest (y + 1)
      where
        x = findEmptyBlockPosition block

findEmptyBlockPosition :: Block -> Maybe Int
findEmptyBlockPosition block = f block 0
  where
    f [] _ = Nothing
    f (Nothing : _) x = Just x
    f (_ : xs) x = f xs (x + 1)

isSolved :: Sudoku -> Bool
isSolved s = all isBlockSolved (getBlocks s)

isBlockSolved :: Block -> Bool
isBlockSolved block = all isJust block && isBlockSolvable block

isSolvable :: Sudoku -> Bool
isSolvable s = all isBlockSolvable (getBlocks s)

isBlockSolvable :: Block -> Bool
isBlockSolvable block = length list == length (fromList list)
  where
    list = catMaybes block

isValid :: Sudoku -> Bool
isValid (Sudoku s) = length s == 9 && all (\x -> length x == 9) s

getBlocks :: Sudoku -> [Block]
getBlocks (Sudoku s) = rows ++ columns ++ squares
  where
    rows = s
    columns = transpose s
    squares = (chunksOf 9 . concat . concat . transpose) (chunksOf 3 <$> s)

replaceOnPosition :: Position -> Maybe Int -> Sudoku -> Sudoku
replaceOnPosition (x, y) value (Sudoku s) = Sudoku $ replace y (replace x value (s !! y)) s

replace :: Int -> a -> [a] -> [a]
replace x v a = take x a ++ v : drop (x + 1) a