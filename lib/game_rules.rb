require_relative './moves.rb'
require_relative './marker.rb'
module GameRules
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

  def self.won?(board)
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != Spot::EMPTY_SPOT
    end
  end

  def self.draw?(board)
    Moves.full?(board.cells) && !won?(board)
  end

  def self.over?(board)
    won?(board) || draw?(board)
  end

  def self.winner(board)
    board.cells[won?(board)[0]] if won?(board)
  end

  def self.winning?(board, current_player)
    WIN_COMBINATIONS.any? do |combo|
      combo.all? { |position| board.cells[position] == current_player.marker }
    end
  end
end
