require_relative './game_rules.rb'

class Board
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
    input = input.to_i
    @cells[input - 1] = player.marker
  end
end
