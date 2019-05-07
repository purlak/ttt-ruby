module Moves
  def valid_move?(board, input)
    input = input.to_i
    !taken?(board, input) && input.between?(1, 9)
  end

  def get_position(board, input)
    input = input.to_i
    board.cells[input - 1]
  end

  def full?(cells)
    cells.none? { |cell| cell == ' ' || cell.nil? }
  end

  def turn_count(cells)
    cells.count { |cell| cell == 'X' || cell == 'O' }
  end

  def taken?(board, input)
    get_position(board, input) == 'X' || get_position(board, input) == 'O'
  end
end
