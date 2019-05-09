module Moves
  def valid_move?(board, input)
    input = input.to_i
    !taken?(board, input) && input.between?(Primitives::ONE, Primitives::NINE)
  end

  def get_position(board, input)
    board.cells[input - Primitives::ONE]
  end

  def full?(cells)
    cells.none? { |cell| cell == Primitives::EMPTY_STRING || cell.nil? }
  end

  def turn_count(cells)
    cells.count { |cell| cell == Primitives::MARKER_X || cell == Primitives::MARKER_O }
  end

  def taken?(board, input)
    get_position(board, input) == Primitives::MARKER_X || get_position(board, input) == Primitives::MARKER_O
  end
end
