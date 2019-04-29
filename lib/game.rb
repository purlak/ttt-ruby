require_relative './player.rb'
require_relative './content.rb'
require_relative './moves.rb'
class Game
  include Moves
  attr_accessor :board, :player1, :player2

  def initialize(board = Board.new)
    @board = board
  end

  def user_input
    input = gets.chomp
    case input
    when '1'
      @player1 = Player::Human.new('X')
      @player2 = Player::Human.new('O')
    when '2'
      @player1 = Player::Human.new('X')
      @player2 = Player::Ai.new('O', @player1)
    else
      puts "\nInvalid choice. Select '1' or '2' to start game:"
      user_input
    end
  end

  def turn
    puts "\nIt's now #{current_player.marker}'s turn."
    input = current_player.move(board, self).to_i
    if @board.valid_move?(input.to_s)
      @board.update(input, current_player)
      @board.display_board
    elsif input.between?(1, 9) == false
      puts "\nThis move is not valid. Try again."
      turn
    else
      puts "\nLooks like that position is taken. Try again."
      turn
    end
  end

  def play
    user_input
    @board.reset!
    @board.display_board
    turn until over?
    if draw?
      puts "\nGame Draws."
    elsif won?
      puts "\nGame Over. Winner is #{winner}."
    end
  end
end
