require_relative './game_rules.rb'
require_relative './moves.rb'
class Board
  include Moves
  include GameRules
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display_board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def update_board(input, player)
    @cells[input - 1] = player.marker
  end
end
