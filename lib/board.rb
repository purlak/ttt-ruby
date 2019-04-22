require 'pry'
class Board
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
  ]

  def initialize
    reset!
  end

  def reset!
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def get_position(input)
    input = input.to_i
    @board[input-1]
  end

  def full?
    @board.none? {|cell| cell == " " || cell == nil}
  end

  def turn_count
    @board.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    get_position(input) == "X" || get_position(input) == "O"
  end

  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end

  def update(input, player)
    input = input.to_i
    @board[input -1] = player.marker
  end
end
