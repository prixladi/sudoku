module Main (main) where

import Data.List (intercalate)
import Data.List.Split (chunksOf)
import Solver (Block, Sudoku (..), isValid, solve)
import Text.Read (readMaybe)

main :: IO ()
main = do
  contents <- getContents
  case run contents of
    Left a -> putStrLn $ "Error: " ++ a
    Right a -> putStrLn a

run :: String -> Either String String
run s = do
  input <- parseSudoku s
  solved <- runSudoku input
  pure (displaySolution input solved)

runSudoku :: Sudoku -> Either String Sudoku
runSudoku input = maybeToEither err (solve input)
  where
    err = "Provided sudoku has no solution!\n" ++ displaySudoku input

parseSudoku :: String -> Either String Sudoku
parseSudoku s
  | isValid sudoku = Right sudoku
  | otherwise = Left errorMessage
  where
    parsedTiles = parseTiles s
    sudoku = Sudoku $ chunksOf 9 (parsedTiles ++ replicate (81 - length parsedTiles) Nothing)
    errorMessage = "Provided sudoku is not valid!" ++ "\n" ++ displaySudoku sudoku

parseTiles :: String -> [Maybe Int]
parseTiles s = readMaybe <$> words s

maybeToEither :: a -> Maybe b -> Either a b
maybeToEither _ (Just b) = Right b
maybeToEither a _ = Left a

displaySolution :: Sudoku -> Sudoku -> String
displaySolution (Sudoku input) (Sudoku solution) =
  replicate 78 '_'
    ++ "\n"
    ++ intercalate "\n" (displaySolutionRow <$> zip input solution)
    ++ "\n"
    ++ replicate 78 '⎻'

displaySudoku :: Sudoku -> String
displaySudoku (Sudoku s) = intercalate "\n" (displayRow <$> s)

displaySolutionRow :: (Block, Block) -> String
displaySolutionRow (a, b) = displayRow a ++ " -> " ++ displayRow b

displayRow :: Block -> String
displayRow r = "| " ++ intercalate " | " (maybe "/" show <$> r) ++ " |"
