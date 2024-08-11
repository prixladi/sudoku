# Sudoku

Simple sudoku solver written in Haskell.

## Requirements

- [GHC](https://www.haskell.org/ghc/)
- [Cabal](https://www.haskell.org/cabal/)
- [Stack](https://docs.haskellstack.org/en/stable/#__tabbed_1_1)

## Installation

For development and testing purposes you can run the project using the following command:

```sh
stack run
```

To install the application on your system you need to build the project ...

```sh
stack build
```

... and then copy the binary to your bin folder:

```sh
cp $(stack path --local-install-root)/bin/sudoku-exe ~/bin/sudoku
```

## Usage

The application accepts the sudoku layout on its standard input. The layout is formatted as a space-delimited sequence of numbers in sudoku line by line with a character `slash` (/) serving as a placeholder for a blank tile.

Input should be 81 characters long (9x9 board) if the input is longer than 81 characters program will end with an error status code. If the input is shorter than 81 characters, the rest of the tiles will be treated as blanks.

The result of the application is a formatted output with a starting board to the left and a solution to the right in case of the solvable and valid board. In case of an invalid layout or unsolvable sudoku, result will be an error message and formatted staring board.

### Examples

**Solvabe board**

```sh
# Command

> echo "/ 3 / / 2 / 8 7 1 / 7 / / / 8 3 / / 9 / / / 7 / 2 / / 1 9 / / / 5 4 2 / 8 / / / / / / / / 5 2 / / / 1 / / 3 / 4 / 5 / 6 / / / 6 / / 4 / / 5 9 / / / 8 / / / / 6 /" | stack run

# Result
______________________________________________________________________________
| / | 3 | / | / | 2 | / | 8 | 7 | 1 | -> | 4 | 3 | 5 | 6 | 2 | 9 | 8 | 7 | 1 |
| / | 7 | / | / | / | 8 | 3 | / | / | -> | 2 | 7 | 6 | 1 | 5 | 8 | 3 | 4 | 9 |
| 9 | / | / | / | 7 | / | 2 | / | / | -> | 9 | 8 | 1 | 3 | 7 | 4 | 2 | 5 | 6 |
| 1 | 9 | / | / | / | 5 | 4 | 2 | / | -> | 1 | 9 | 3 | 8 | 6 | 5 | 4 | 2 | 7 |
| 8 | / | / | / | / | / | / | / | / | -> | 8 | 6 | 7 | 2 | 4 | 3 | 9 | 1 | 5 |
| 5 | 2 | / | / | / | 1 | / | / | 3 | -> | 5 | 2 | 4 | 7 | 9 | 1 | 6 | 8 | 3 |
| / | 4 | / | 5 | / | 6 | / | / | / | -> | 7 | 4 | 9 | 5 | 8 | 6 | 1 | 3 | 2 |
| 6 | / | / | 4 | / | / | 5 | 9 | / | -> | 6 | 1 | 2 | 4 | 3 | 7 | 5 | 9 | 8 |
| / | / | 8 | / | / | / | / | 6 | / | -> | 3 | 5 | 8 | 9 | 1 | 2 | 7 | 6 | 4 |
⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻
```

**Unsolvable board**

```sh
# Command

> echo "/ 3 / / 2 / 8 7 1 / 7 / / / 8 3 / / 9 / / / 7 / 2 / / 1 9 / / / 5 4 2 / 8 / / / / / / / / 5 2 / / / 1 / / 3 / 4 / 5 / 6 / / / 6 / / 4 / / 5 9 / / / 8 / / / / 1 /" | stack run

# Result
Error: Provided sudoku layout has no solution!
| / | 3 | / | / | 2 | / | 8 | 7 | 1 |
| / | 7 | / | / | / | 8 | 3 | / | / |
| 9 | / | / | / | 7 | / | 2 | / | / |
| 1 | 9 | / | / | / | 5 | 4 | 2 | / |
| 8 | / | / | / | / | / | / | / | / |
| 5 | 2 | / | / | / | 1 | / | / | 3 |
| / | 4 | / | 5 | / | 6 | / | / | / |
| 6 | / | / | 4 | / | / | 5 | 9 | / |
| / | / | 8 | / | / | / | / | 1 | / |
```

**Invalid board with too many tiles**

```sh
# Command

echo "1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9 1 2 3 4 5 6 7 8 9 9" | stack run

# Result
Error: Provided sudoku is not valid!
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| 9 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| 9 | 9 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| 8 | 9 | 9 | 1 | 2 | 3 | 4 | 5 | 6 |
| 7 | 8 | 9 | 9 | 1 | 2 | 3 | 4 | 5 |
| 6 | 7 | 8 | 9 | 9 | 1 | 2 | 3 | 4 |
| 5 | 6 | 7 | 8 | 9 | 9 | 1 | 2 | 3 |
| 4 | 5 | 6 | 7 | 8 | 9 | 9 | 1 | 2 |
| 3 | 4 | 5 | 6 | 7 | 8 | 9 | 9 | 1 |
| 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 9 |
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| 9 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| 9 | 9 |
```

**Invalid board with invalid tile**

```sh
# Command

echo "1 2 33" | stack run

# Result
Error: Provided sudoku layout is not valid!
| 1 | 2 | 33 | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
| / | / | / | / | / | / | / | / | / |
```

## Tests

Tests can be run using following command:

```sh
stack test
```
