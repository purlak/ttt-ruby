require_relative './player.rb'
require_relative './game_rules.rb'
require_relative './moves.rb'
require_relative './spot.rb'
require_relative './marker.rb'

class Game
  attr_accessor :board, :player1, :player2, :rules

  def initialize(board = Board.new, player1 = nil, player2 = nil, _rules = GameRules)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def turn
    puts "\nIt's now #{current_player.marker}'s turn."
    input = current_player.move(board, current_player, opponent).to_i
    if Moves.valid_move?(@board, input.to_s)
      @board.update_board(input, current_player)
      @board.display_board
    elsif input.between?(Spot::FIRST_SPOT, Spot::LAST_SPOT) == false
      puts "\nThis move is not valid. Try again."
      turn
    elsif Moves.taken?(@board, input)
      puts "\nLooks like that position is taken. Try again."
      turn
    end
  end

  def play
    get_player
    @board.reset!
    @board.display_board
    turn until rules.over?(@board)
    if rules.draw?(@board)
      puts "\nGame Draws."
    elsif rules.won?(@board)
      puts "\nGame Over. Winner is #{rules.winner(board)}."
    end
  end

  def current_player
    GetPlayer.current_player(board, player1, player2)
  end

  def opponent
    GetPlayer.opponent(board, player1, player2)
  end

  def get_player
    players = GetPlayer.get_player
    @player1 = players[0]
    @player2 = players[1]
  end
end
