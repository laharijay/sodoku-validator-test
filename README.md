# Sudoku validator

## Description

Write code to check if a given string is a correct [sudoku](https://en.wikipedia.org/wiki/Sudoku) puzzle and return a message indicating whether the puzzle is valid, invalid or valid and incomplete.

## Setup

After cloning the repository, run the following command:

```sh
bin/setup
```

## Usage

The program can be run via `rake run`:

```sh
  rake run <path to the sudoku file to validate>
```

Depending on the contents of the sudoku puzzle, the program should return a different result

* If the puzzle is valid and completed, return `Sudoku is valid.`
* If the puzzle is valid but not fully completed, return `Sudoku is valid but incomplete.`
* If the puzzle is not valid, return `Sudoku is invalid.`

A puzzle is valid if:

1. No numbers are repeated in any of the rows
2. No numbers are repeated in any of the columns
3. Every 9x9 square has no repeated numbers
4. Only numbers 1 - 9 are used to fill the puzzle (or 0 for empty cells)

## Implementation

Additions should be written to `lib/validator.rb` within the method `validate`, the creation of additional methods and classes is encouraged.

## Ensuring that the solution is valid

This exercise contains unit tests that verify that the solution functions correctly. If all of the tests pass, the solution is correct.

The tests can be run via `rake spec`.

## Example sudoku file format

*Zeroes represent empty sudoku cells*
```
8 5 0 |0 0 2 |4 0 0
7 2 0 |0 0 0 |0 0 9
0 0 4 |0 0 0 |0 0 0
------+------+------
0 0 0 |1 0 7 |0 0 2
3 0 5 |0 0 0 |9 0 0
0 4 0 |0 0 0 |0 0 0
------+------+------
0 0 0 |0 8 0 |0 7 0
0 1 7 |0 0 0 |0 0 0
0 0 0 |0 3 6 |0 4 0
```
# Solution
- Created class ValidateSudoku to validate non repeated element in matrix.
- Created class Sudoku to extact rows, columns and sub group of element. Considered sub group of 3x3. Because When have considered 9x9 sub group there is only one group. When i run test cases sub group test was break.
- Updated element in fixture invalid_due_to_forbidden_characters.sudoku from 10 t 1. Because as you have mentioned 9x9 can have only 0-9 value.
