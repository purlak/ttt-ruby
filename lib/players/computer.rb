require_relative '../game_rules.rb'
class Player::Computer < Player
  include GameRules
  attr_accessor :board

  def move(board)
    @board = board
    if !winning_move.nil?
      input = winning_move + 1
    elsif !blocking_move.nil?
      input = blocking_move + 1
    elsif center?
      input = 5
    elsif !opposite_corner.nil? && board.taken?(opposite_corner) == false
      input = opposite_corner
    elsif corner
      input = corner + 1
    else
      input = (1..9).to_a.sample while board.taken?(input)
    end
    input.to_s
  end

  def other
    marker == 'X' ? 'O' : 'X'
  end

  def winning_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == marker && board.cells[combo[1]] == marker && board.cells[combo[2]] == ' ') || (board.cells[combo[2]] == marker && board.cells[combo[1]] == marker && board.cells[combo[0]] == ' ') || (board.cells[combo[0]] == marker && board.cells[combo[2]] == marker && board.cells[combo[1]] == ' ')
    end
    unless winning_row.nil?
      winning_cell = winning_row.find { |cell| board.cells[cell] == ' ' }
    end
  end

  def blocking_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == other && board.cells[combo[1]] == other && board.cells[combo[2]] == ' ') || (board.cells[combo[1]] == other && board.cells[combo[2]] == other && board.cells[combo[0]] == ' ') || (board.cells[combo[2]] == other && board.cells[combo[0]] == other && board.cells[combo[1]] == ' ')
    end
    unless winning_row.nil?
      winning_cell = winning_row.find { |cell| board.cells[cell] == ' ' }
    end
  end

  def center?
    board.cells[4] == ' '
  end

  def corners
    CORNERS.shuffle!
  end

  def corner
    corners.find { |corner| board.cells[corner] == ' ' }
  end

  def opposite_corner
    if board.taken?(1) && !board.taken?(9)
      9
    elsif board.taken?(9) && !board.taken?(1)
      1
    elsif board.taken?(3) && !board.taken?(7)
      7
    elsif board.taken?(7) && !board.taken?(3)
      3
    end
  end
end
