require_relative './game_rules.rb'
require_relative './moves.rb'
require_relative './primitives.rb'
class Minimax
  include Moves
  include GameRules
  attr_accessor :game

  def move(game)
    @game = game
    current_player = game.player2
    opponent = game.player1
    new_board = game.board.clone
    if taken?(new_board, Primitives::FIVE)
      best_move(new_board, current_player, opponent)
    else
      return Primitives::FIVE
    end
  end

  def best_move(board, current_player, opponent, recursion_counter = Primitives::ZERO)
    scores = {}
    available_spots = empty_indexes(board)
    return score_move(board, recursion_counter, current_player, opponent) if @game.over?(board) != false

    available_spots.each do |spot|
      board.update_board(spot, current_player)
      scores[spot] = Primitives::MULTIPLIER * best_move(board, opponent, current_player, recursion_counter + Primitives::ONE)
      board.cells[spot - 1] = Primitives::EMPTY_STRING
    end
    evaluate(recursion_counter, scores)
  end

  def empty_indexes(board)
    new_array = board.cells.each_index.select { |cell| board.cells[cell] != Primitives::MARKER_X && board.cells[cell] != Primitives::MARKER_O }
    new_array.map! { |item| item += Primitives::ONE }
  end

  def score_move(board, recursion_counter, current_player, opponent)
    if board.winning?(board, current_player)
      Primitives::TEN - recursion_counter
    elsif board.winning?(board, opponent)
      recursion_counter - Primitives::TEN
    else
      0
    end
  end

  def max_best_move(scores)
    scores.max_by { |_key, value| value }[Primitives::ZERO]
  end

  def max_best_score(scores)
    scores.max_by { |_key, value| value }[Primitives::ONE]
  end

  def evaluate(recursion_counter, scores)
    recursion_counter.zero? ? max_best_move(scores) : max_best_score(scores)
  end
end
