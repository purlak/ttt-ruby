class Player::Computer < Player
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  CORNERS = [0, 2, 8, 6].freeze

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
      (board.board[combo[0]] == marker && board.board[combo[1]] == marker && board.board[combo[2]] == ' ') || (board.board[combo[2]] == marker && board.board[combo[1]] == marker && board.board[combo[0]] == ' ') || (board.board[combo[0]] == marker && board.board[combo[2]] == marker && board.board[combo[1]] == ' ')
    end
    unless winning_row.nil?
      winning_cell = winning_row.find { |cell| board.board[cell] == ' ' }
    end
  end

  def blocking_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      (board.board[combo[0]] == other && board.board[combo[1]] == other && board.board[combo[2]] == ' ') || (board.board[combo[1]] == other && board.board[combo[2]] == other && board.board[combo[0]] == ' ') || (board.board[combo[2]] == other && board.board[combo[0]] == other && board.board[combo[1]] == ' ')
    end
    unless winning_row.nil?
      winning_cell = winning_row.find { |cell| board.board[cell] == ' ' }
    end
  end

  def center?
    board.board[4] == ' '
  end

  def corners
    CORNERS.shuffle!
  end

  def corner
    corners.find { |corner| board.board[corner] == ' ' }
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
