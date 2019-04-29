module Moves
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

  def current_player
    @board.turn_count.even? ? @player1 : @player2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.board[combo[0]] == @board.board[combo[1]] && @board.board[combo[1]] == @board.board[combo[2]] && @board.board[combo[0]] != ' '
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board.board[won?[0]] if won?
  end
end
