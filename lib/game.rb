require_relative './player.rb'
require_relative './game_rules.rb'
require_relative './moves.rb'
require_relative './spot.rb'
require_relative './marker.rb'

class Game
  attr_accessor :board, :player1, :player2, :rules

  def initialize(board = Board.new, player1 = nil, player2 = nil, rules = GameRules)
    @rules = rules
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def turn(display_text = DisplayText.new)
    display_text.call("\nIt's now #{current_player.marker}'s turn.\n")
    input = current_player.move(board, current_player, opponent).to_i
    if Moves.valid_move?(@board, input.to_s)
      @board.update_board(input, current_player)
      @board.display_board
    elsif input.between?(Spot::FIRST_SPOT, Spot::LAST_SPOT) == false
      display_text.call("\nThis move is not valid. Try again.")
      turn
    elsif Moves.taken?(@board, input)
      display_text.call("\nLooks like that position is taken. Try again.")
      turn
    end
  end

  def play(get_players, display_text = DisplayText.new)
    players = get_players.get
    @player1 = players[0]
    @player2 = players[1]
    @board.display_board
    turn until @rules.over?(@board)
    if @rules.draw?(@board)
      display_text.call("\nGame Draws.")
    elsif @rules.won?(@board)
      display_text.call("\nGame Over. Winner is #{@rules.winner(board)}.")
    end
  end

  def current_player
    GetPlayers.current_player(board, player1, player2)
  end

  def opponent
    GetPlayers.opponent(board, player1, player2)
  end
end
