# https://leetcode.com/problems/valid-sudoku/description/

# [
#   ["5","3",".",".","7",".",".",".","."],
#   ["6",".",".","1","9","5",".",".","."],
#   [".","9","8",".",".",".",".","6","."],
#   ["8",".",".",".","6",".",".",".","3"],
#   ["4",".",".","8",".","3",".",".","1"],
#   ["7",".",".",".","2",".",".",".","6"],
#   [".","6",".",".",".",".","2","8","."],
#   [".",".",".","4","1","9",".",".","5"],
#   [".",".",".",".","8",".",".","7","9"]
# ]

defmodule ValidSudoku do
  def valid_board?(x \\ 1) do
    rows = Boards.board(x)
    # valid_rows?(rows) && valid_columns?(rows)
    valid_columns?(rows)
  end

  def valid_rows?([]), do: true
  def valid_rows?([head | tail]) do
    case valid_row?(head) do
      true -> valid_rows?(tail)
      false -> false
    end
  end

  def valid_row?([]), do: true
  def valid_row?(["." | tail]), do: valid_row?(tail)
  def valid_row?([head | tail]) do
    case !Enum.member?(tail, head) do
      true -> valid_row?(tail)
      false -> false
    end
  end

  def valid_columns?(rows), do: valid_columns?(rows, 0)
  def valid_columns?(_rows, 9), do: true
  def valid_columns?(rows, column_index) do
    case valid_column?(rows, column_index) do
      true -> valid_column?(rows, column_index + 1)
      false -> false
    end
  end

  def valid_column?([], _column_index), do: true
  def valid_column?([head | tail], column_index) do
    subject = Enum.at(head, column_index)
    if subject == "." do
      valid_column?(tail, column_index)
    else
      case valid_column_for_subject?(tail, column_index, subject) do
        true -> valid_column?(tail, column_index)
        false -> false
      end
    end
  end

  def valid_column_for_subject?([], _column_index, _subject), do: true
  def valid_column_for_subject?([head | tail], column_index, subject) do
    IO.inspect "=============================="
    IO.puts "Checking #{subject} against #{Enum.at(head, column_index)}"
    IO.inspect "=============================="
    case Enum.at(head, column_index) do
      "." -> valid_column_for_subject?(tail, column_index, subject)
      ^subject -> false
      _ -> valid_column_for_subject?(tail, column_index, subject)
    end
  end
end

defmodule Boards do
  # valid
  def board(1) do
    [
      ["5","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","."],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".",".","7","9"]
    ]
  end

  # invalid row
  def board(2) do
    [
      ["5","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","8"],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".",".","7","9"]
    ]
  end

  # invalid column
  def board(3) do
    [
      ["5","3","2",".","7",".",".",".","."],
      ["6",".","2","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","3"],
      [".",".",".","4","1","9",".",".","5"],
      [".",".","1",".","8",".",".","7","9"]
    ]
  end

  # invalid box
  def board(4) do
    [
      ["5","3",".",".","7",".",".",".","."],
      ["6",".",".","1","9","5",".",".","."],
      [".","9","8",".",".",".",".","6","."],
      ["8",".",".",".","6",".",".",".","3"],
      ["4",".",".","8",".","3",".",".","1"],
      ["7",".",".",".","2",".",".",".","6"],
      [".","6",".",".",".",".","2","8","3"],
      [".",".",".","4","1","9",".",".","5"],
      [".",".",".",".","8",".","3","7","9"]
    ]
  end
end
