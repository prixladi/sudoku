module SolverTest (spec) where

import Solver ( Sudoku(Sudoku), solve )
import Test.HUnit ( assertEqual, Test(..) )

emptySudokuSpec :: Test
emptySudokuSpec =
  TestLabel "Solve empty sudoku" $
    TestCase $
      assertEqual
        "Expect correctly solved board"
        ( Just
            ( Sudoku
                [ [Just 1, Just 2, Just 3, Just 4, Just 5, Just 6, Just 7, Just 8, Just 9],
                  [Just 4, Just 5, Just 6, Just 7, Just 8, Just 9, Just 1, Just 2, Just 3],
                  [Just 7, Just 8, Just 9, Just 1, Just 2, Just 3, Just 4, Just 5, Just 6],
                  [Just 2, Just 1, Just 4, Just 3, Just 6, Just 5, Just 8, Just 9, Just 7],
                  [Just 3, Just 6, Just 5, Just 8, Just 9, Just 7, Just 2, Just 1, Just 4],
                  [Just 8, Just 9, Just 7, Just 2, Just 1, Just 4, Just 3, Just 6, Just 5],
                  [Just 5, Just 3, Just 1, Just 6, Just 4, Just 2, Just 9, Just 7, Just 8],
                  [Just 6, Just 4, Just 2, Just 9, Just 7, Just 8, Just 5, Just 3, Just 1],
                  [Just 9, Just 7, Just 8, Just 5, Just 3, Just 1, Just 6, Just 4, Just 2]
                ]
            )
        )
        ( solve
            ( Sudoku
                [ [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing]
                ]
            )
        )

solvedSudokuSpec :: Test
solvedSudokuSpec =
  TestLabel "Solve solved sudoku" $
    TestCase $
      assertEqual
        "Expect correctly solved board"
        ( Just
            ( Sudoku
                [ [Just 8, Just 2, Just 7, Just 1, Just 5, Just 4, Just 3, Just 9, Just 6],
                  [Just 9, Just 6, Just 5, Just 3, Just 2, Just 7, Just 1, Just 4, Just 8],
                  [Just 3, Just 4, Just 1, Just 6, Just 8, Just 9, Just 7, Just 5, Just 2],
                  [Just 5, Just 9, Just 3, Just 4, Just 6, Just 8, Just 2, Just 7, Just 1],
                  [Just 4, Just 7, Just 2, Just 5, Just 1, Just 3, Just 6, Just 8, Just 9],
                  [Just 6, Just 1, Just 8, Just 9, Just 7, Just 2, Just 4, Just 3, Just 5],
                  [Just 7, Just 8, Just 6, Just 2, Just 3, Just 5, Just 9, Just 1, Just 4],
                  [Just 1, Just 5, Just 4, Just 7, Just 9, Just 6, Just 8, Just 2, Just 3],
                  [Just 2, Just 3, Just 9, Just 8, Just 4, Just 1, Just 5, Just 6, Just 7]
                ]
            )
        )
        ( solve
            ( Sudoku
                [ [Just 8, Just 2, Just 7, Just 1, Just 5, Just 4, Just 3, Just 9, Just 6],
                  [Just 9, Just 6, Just 5, Just 3, Just 2, Just 7, Just 1, Just 4, Just 8],
                  [Just 3, Just 4, Just 1, Just 6, Just 8, Just 9, Just 7, Just 5, Just 2],
                  [Just 5, Just 9, Just 3, Just 4, Just 6, Just 8, Just 2, Just 7, Just 1],
                  [Just 4, Just 7, Just 2, Just 5, Just 1, Just 3, Just 6, Just 8, Just 9],
                  [Just 6, Just 1, Just 8, Just 9, Just 7, Just 2, Just 4, Just 3, Just 5],
                  [Just 7, Just 8, Just 6, Just 2, Just 3, Just 5, Just 9, Just 1, Just 4],
                  [Just 1, Just 5, Just 4, Just 7, Just 9, Just 6, Just 8, Just 2, Just 3],
                  [Just 2, Just 3, Just 9, Just 8, Just 4, Just 1, Just 5, Just 6, Just 7]
                ]
            )
        )

hardSudokuSpec :: Test
hardSudokuSpec =
  TestLabel "Solve hard sudoku" $
    TestCase $
      assertEqual
        "Expect correctly solved board"
        ( Just
            ( Sudoku
                [ [Just 4, Just 3, Just 5, Just 6, Just 2, Just 9, Just 8, Just 7, Just 1],
                  [Just 2, Just 7, Just 6, Just 1, Just 5, Just 8, Just 3, Just 4, Just 9],
                  [Just 9, Just 8, Just 1, Just 3, Just 7, Just 4, Just 2, Just 5, Just 6],
                  [Just 1, Just 9, Just 3, Just 8, Just 6, Just 5, Just 4, Just 2, Just 7],
                  [Just 8, Just 6, Just 7, Just 2, Just 4, Just 3, Just 9, Just 1, Just 5],
                  [Just 5, Just 2, Just 4, Just 7, Just 9, Just 1, Just 6, Just 8, Just 3],
                  [Just 7, Just 4, Just 9, Just 5, Just 8, Just 6, Just 1, Just 3, Just 2],
                  [Just 6, Just 1, Just 2, Just 4, Just 3, Just 7, Just 5, Just 9, Just 8],
                  [Just 3, Just 5, Just 8, Just 9, Just 1, Just 2, Just 7, Just 6, Just 4]
                ]
            )
        )
        ( solve
            ( Sudoku
                [ [Nothing, Just 3, Nothing, Nothing, Just 2, Nothing, Just 8, Just 7, Just 1],
                  [Nothing, Just 7, Nothing, Nothing, Nothing, Just 8, Just 3, Nothing, Nothing],
                  [Just 9, Nothing, Nothing, Nothing, Just 7, Nothing, Just 2, Nothing, Nothing],
                  [Just 1, Just 9, Nothing, Nothing, Nothing, Just 5, Just 4, Just 2, Nothing],
                  [Just 8, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Just 5, Just 2, Nothing, Nothing, Nothing, Just 1, Nothing, Nothing, Just 3],
                  [Nothing, Just 4, Nothing, Just 5, Nothing, Just 6, Nothing, Nothing, Nothing],
                  [Just 6, Nothing, Nothing, Just 4, Nothing, Nothing, Just 5, Just 9, Nothing],
                  [Nothing, Nothing, Just 8, Nothing, Nothing, Nothing, Nothing, Just 6, Nothing]
                ]
            )
        )

brokenSudokuSpec :: Test
brokenSudokuSpec =
  TestLabel "Fail for broken sudoku" $
    TestCase $
      assertEqual
        "Expect correctly solved board"
        Nothing
        ( solve
            ( Sudoku
                [ [Just 3, Just 3, Nothing, Nothing, Just 2, Nothing, Just 8, Just 7, Just 1],
                  [Nothing, Just 7, Nothing, Nothing, Nothing, Just 8, Just 3, Nothing, Nothing],
                  [Just 9, Nothing, Nothing, Nothing, Just 7, Nothing, Just 2, Nothing, Nothing],
                  [Just 1, Just 9, Nothing, Nothing, Nothing, Just 5, Just 4, Just 2, Nothing],
                  [Just 8, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Just 5, Just 2, Nothing, Nothing, Nothing, Just 1, Nothing, Nothing, Just 3],
                  [Nothing, Just 4, Nothing, Just 5, Nothing, Just 6, Nothing, Nothing, Nothing],
                  [Just 6, Nothing, Nothing, Just 4, Nothing, Nothing, Just 5, Just 9, Nothing],
                  [Nothing, Nothing, Just 8, Nothing, Nothing, Nothing, Nothing, Just 6, Nothing]
                ]
            )
        )

unsovableSudokuSpec :: Test
unsovableSudokuSpec =
  TestLabel "Fail for unsolvable sudoku" $
    TestCase $
      assertEqual
        "Expect correctly solved board"
        Nothing
        ( solve
            ( Sudoku
                [ [Nothing, Just 6, Nothing, Nothing, Just 2, Nothing, Just 8, Just 7, Just 1],
                  [Nothing, Just 7, Nothing, Nothing, Nothing, Just 8, Just 3, Nothing, Nothing],
                  [Just 9, Nothing, Nothing, Nothing, Just 7, Nothing, Just 2, Nothing, Nothing],
                  [Just 1, Just 9, Nothing, Nothing, Nothing, Just 5, Just 4, Just 2, Nothing],
                  [Just 8, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing],
                  [Just 5, Just 2, Nothing, Nothing, Nothing, Just 1, Nothing, Nothing, Just 3],
                  [Nothing, Just 4, Nothing, Just 5, Nothing, Just 6, Nothing, Nothing, Nothing],
                  [Just 6, Nothing, Nothing, Just 4, Nothing, Nothing, Just 5, Just 9, Nothing],
                  [Nothing, Nothing, Just 8, Nothing, Nothing, Nothing, Nothing, Just 6, Nothing]
                ]
            )
        )

spec :: Test
spec = TestList [emptySudokuSpec, solvedSudokuSpec, hardSudokuSpec, brokenSudokuSpec, unsovableSudokuSpec]