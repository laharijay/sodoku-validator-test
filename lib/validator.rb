require_relative './sudoku'
require_relative './validate_sudoku'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    sudoku = Sudoku.new(@puzzle_string)
    if sudoku.valid?
      if sudoku.completed?
        return 'Sudoku is valid.'
      else
        return 'Sudoku is valid but incomplete.'
      end
    else
      return 'Sudoku is invalid.'
    end
  end
end
