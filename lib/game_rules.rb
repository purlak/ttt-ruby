require_relative './moves.rb'
require_relative './marker.rb'
module GameRules
  include Moves
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

  def won?(board, _current_player)
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != Spot::EMPTY_SPOT
    end
  end

  def draw?(board)
    full?(board.cells) && !won?(board, current_player)
  end

  def over?(board)
    won?(board, current_player) || draw?(board)
  end

  def winner(board)
    board.cells[won?(board, current_player)[0]] if won?(board, current_player)
  end

  def winning?(board, current_player)
    WIN_COMBINATIONS.any? do |combo|
      combo.all? { |position| board.cells[position] == current_player.marker }
    end
  end
end
