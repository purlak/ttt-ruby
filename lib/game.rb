require_relative './player.rb'
require_relative './content.rb'
require_relative './game_rules.rb'
require_relative './moves.rb'
require_relative './primitives.rb'
require_relative './get_input.rb'

class Game
  include Moves
  include GameRules
  include GetInput
  attr_accessor :board, :player1, :player2

  def initialize(board = Board.new, player1 = nil, player2 = nil)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def user_input
    case get_input
    when '1'
      @player1 = Player::Human.new(Primitives::MARKER_X)
      @player2 = Player::Human.new(Primitives::MARKER_O)
    when '2'
      select_player_order
    else
      puts "\nInvalid choice. Select #{Primitives::ONE} or #{Primitives::TWO} to start game:"
      user_input
    end
  end

  def turn
    puts "\nIt's now #{current_player.marker}'s turn."
    game_clone = clone
    input = current_player.move(game_clone).to_i
    if valid_move?(@board, input.to_s)
      @board.update_board(input, current_player)
      @board.display_board
    elsif input.between?(Primitives::ONE, Primitives::NINE) == false
      puts "\nThis move is not valid. Try again."
      turn
    elsif taken?(@board, input)
      puts "\nLooks like that position is taken. Try again."
      turn
    end
  end

  def play
    user_input
    @board.reset!
    @board.display_board
    turn until over?(@board)
    if draw?(@board)
      puts "\nGame Draws."
    elsif won?(@board, current_player)
      puts "\nGame Over. Winner is #{winner(board)}."
    end
  end

  def current_player
    turn_count(@board.cells).even? ? @player1 : @player2
  end

  def select_player_order
    puts "\n Choose 1 to play first, or 2 to play second: "
    case get_input
    when '1'
      @player1 = Player::Human.new(Primitives::MARKER_X)
      @player2 = Player::Ai.new(Primitives::MARKER_O)
    when '2'
      @player1 = Player::Ai.new(Primitives::MARKER_X)
      @player2 = Player::Human.new(Primitives::MARKER_O)
    else
      puts "\nInvalid choice. Select #{Primitives::ONE} or #{Primitives::TWO} to start game:"
      user_input
    end
  end
end
