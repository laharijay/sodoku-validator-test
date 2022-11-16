require 'matrix'
require 'pry'

require_relative './validate_sudoku'

class Sudoku
  attr_reader :sudoku_string

  ROW_SEPARATOR = '|'
  COLUMN_SEPARATOR = '-'
  GROUPS_INDEXES =
    [
      { start_row: 0, start_col: 0 },
      { start_row: 0, start_col: 3 },
      { start_row: 0, start_col: 6 },

      { start_row: 3, start_col: 0 },
      { start_row: 3, start_col: 3 },
      { start_row: 3, start_col: 6 },

      { start_row: 6, start_col: 0 },
      { start_row: 6, start_col: 3 },
      { start_row: 6, start_col: 6 }
  ]

  def initialize(sudoku_string)
    @sudoku_string = sudoku_string
  end

  def valid?
    valid_sections?(rows) && valid_sections?(columns) && valid_sections?(sub_groups)
  end

  def completed?
    !sudoku_string.include?('0')
  end

  def rows
    @rows ||= (0..8).each_with_object([]) do |index, rows_array|
      rows_array << ValidateSudoku.new(matrix.row(index).to_a)
    end
  end

  def columns
    @columns ||= (0..8).each_with_object([]) do |index, columns_array|
      columns_array << ValidateSudoku.new(matrix.column(index).to_a)
    end
  end

  def sub_groups
    @sub_groups ||= GROUPS_INDEXES.each_with_object([]) do |group, sub_groups|
      sub_matrix = matrix.minor(group[:start_row],3,group[:start_col],3)
      sub_groups << ValidateSudoku.new(sub_matrix.to_a.flatten)
    end
  end

  private

  def matrix
    @matrix ||=  begin
    rows = sudoku_string_rows.each_with_object([]) do |row, rw|
      rw << matrix_row(row)
    end
    Matrix.columns(rows)
    end
  end

  def sudoku_string_rows
    @data ||= begin
                s = sudoku_string.split("\n")
                s.reject { |h| h.include?(COLUMN_SEPARATOR) }
              end

  end

  def matrix_row(row_string)
    no_separators = row_string.delete!(ROW_SEPARATOR)
    no_separators.split(//).reject { |h| h == " " }
  end

  def valid_sections?(sections)
    sections.all?(&:valid?)
  end
end
