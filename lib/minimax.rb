require_relative './game_rules.rb'
require_relative './moves.rb'
require_relative './spot.rb'
require_relative './player.rb'
require_relative './players/ai.rb'
require_relative './marker.rb'
require_relative './score.rb'

class Minimax
  def move(board, current_player, opponent)
    new_board = board.clone
    if Moves.taken?(new_board, Spot::FIVE)
      best_move(new_board, current_player, opponent)
    else
      return Spot::FIVE
    end
  end

  def best_move(board, current_player, opponent, recursion_counter = 0)
    scores = {}
    available_spots = empty_indexes(board)
    return score_move(board, recursion_counter, current_player, opponent) if GameRules.over?(board) != false

    available_spots.each do |spot|
      board.update_board(spot, current_player)
      scores[spot] = Score::MULTIPLIER * best_move(board, opponent, current_player, recursion_counter + 1)
      board.cells[spot - 1] = Spot::EMPTY_SPOT
    end
    evaluate(recursion_counter, scores)
  end

  def empty_indexes(board)
    new_array = board.cells.each_index.select { |cell| board.cells[cell] != Marker::X && board.cells[cell] != Marker::O }
    new_array.map! { |item| item += 1 }
  end

  def score_move(board, recursion_counter, current_player, opponent)
    if GameRules.winning?(board, current_player)
      Score::COUNTER - recursion_counter
    elsif GameRules.winning?(board, opponent)
      recursion_counter - Score::COUNTER
    else
      0
    end
  end

  def max_best_move(scores)
    scores.max_by { |_key, value| value }[0]
  end

  def max_best_score(scores)
    scores.max_by { |_key, value| value }[1]
  end

  def evaluate(recursion_counter, scores)
    recursion_counter.zero? ? max_best_move(scores) : max_best_score(scores)
  end
end
