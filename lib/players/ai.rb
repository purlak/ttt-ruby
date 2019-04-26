class Player::Ai < Player
  attr_accessor :board, :score

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

  def initialize(score = 0)
    @score = score
  end

  def move(board)
    @board = board
    @humanPlayer = 'X'
    # return a value if a terminal state is found (+10, 0, -10)
    get_score
    # go through available spots on the board
    # call the minimax function on each available spot (recursion)
    available_spots = empty_indexes(board)
    # binding.pry
    best_move = 1
    available_spots.each do |spot|
      input = minimax(board.board[spot])
      # evaluate returning values from function calls
      # and return the best value
    end
    best_move.to_s
  end

  def empty_indexes(board)
    board.board.each_index.select { |cell| board.board[cell] == ' ' }
  end

  def get_score
    # if won?
    #   @score += 10
    # elsif draw?
    #   @score -= 0
    # else
    #   @score = 0
    # end
  end

  def minimax(spot); end
end
