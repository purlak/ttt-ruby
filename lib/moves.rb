module Moves
  def self.valid_move?(board, input)
    input = input.to_i
    !taken?(board, input) && input.between?(Spot::FIRST_SPOT, Spot::LAST_SPOT)
  end

  def self.get_position(board, input)
    board.cells[input - 1]
  end

  def self.full?(cells)
    cells.none? { |cell| cell == Spot::EMPTY_SPOT || cell.nil? }
  end

  def self.turn_count(cells)
    cells.count { |cell| cell == Marker::X || cell == Marker::O }
  end

  def self.taken?(board, input)
    get_position(board, input) == Marker::X || get_position(board, input) == Marker::O
  end
end
