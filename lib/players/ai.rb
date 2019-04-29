require_relative '../moves.rb'
class Player::Ai < Player
  include Moves
  attr_accessor :board, :marker, :human_player, :score, :counter, :game

  def initialize(marker, human_player)
    @marker = marker
    @human_player = human_player
  end

  def move(board, game, recursion_counter = 0)
    @board = board
    @game = game
    scores = {}
    @recursion_counter = recursion_counter
    return score_move if over?

    available_spots = empty_indexes(board)
    available_spots.each do |spot|
      binding.pry
      board.update(spot + 1, self)
      scores[spot] =
        -1 * move(board, @recursion_counter + 1)
      board.reset_spot(spot)
    end
    minimax(scores)
  end

  def empty_indexes(board)
    board.board.each_index.select { |cell| board.board[cell] == ' ' }
  end

  def max_best_move(_scores)
    @scores.max_by { |_key, value| value }[0]
  end

  def max_best_score(scores)
    scores.max_by { |_key, value| value }[1]
  end

  def minimax(scores)
    @recursion_counter.zero? ? max_best_move(scores) : max_best_score(scores)
  end

  def score_move
    if @game.current_player.marker == 'O' && won?
      10 - @recursion_counter
    elsif @game.current_player.marker == 'X' && won?
      @recursion_counter - 10
    elsif
      0
    end
  end
end
