module Main (main) where

import qualified SolverTest
import System.Exit (ExitCode (ExitFailure), exitSuccess, exitWith)
import Test.HUnit (Counts (errors, failures), Test (TestList), runTestTT)

main :: IO Counts
main = do
  results <-
    runTestTT $ TestList [SolverTest.spec]
  if errors results + failures results == 0
    then exitSuccess
    else exitWith (ExitFailure 1)
