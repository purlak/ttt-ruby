class Game
  attr_accessor :board

  def call
    user_input
    display_board
  end

  def initialize
    @board = Array.new(9)
  end

  def user_input
    gets.chomp
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '--------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '--------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
