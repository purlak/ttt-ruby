require_relative './player.rb'
require_relative './content.rb'

class Game
  attr_accessor :board, :player1, :player2

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

  def initialize(board = Board.new)
    @board = board
  end

  def user_input
    input = gets.chomp
    case input
      when '1'
        @player1 = Player::Human.new("X")
        @player2 = Player::Human.new("O")
      when '2'
        @player1 = Player::Human.new("X")
        @player2 = Player::Ai.new("O")
      else
        puts "\nInvalid choice. Select '1' or '2' to start game:"
        user_input
    end
  end

  def current_player
    @board.turn_count.even? ? @player1 : @player2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.board[combo[0]] == @board.board[combo[1]] && @board.board[combo[1]] == @board.board[combo[2]] && @board.board[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end
  
  def winner
    @board.board[won?[0]] if won?
  end

  def turn
    puts "\nIt's now #{current_player.marker}'s turn."
    input = current_player.move(board).to_i
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
    until over?
      turn
    end
    if draw?
      puts "\nGame Draws."
    elsif won?
      puts "\nGame Over. Winner is #{winner}."
    end
  end
end
