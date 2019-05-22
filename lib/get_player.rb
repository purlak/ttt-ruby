require_relative './moves.rb'
require_relative './display_text.rb'
require_relative './content.rb'
require_relative './menu_option.rb'
require_relative './counter.rb'
require_relative './get_input.rb'

module GetPlayer
  def self.current_player(board, player1, player2)
    Moves.turn_count(board.cells).even? ? player1 : player2
  end

  def self.opponent(board, player1, player2)
    Moves.turn_count(board.cells).odd? ? player1 : player2
  end

  def self.get_player
    players = []
    counter = Counter::ONE
    while counter <= Counter::TWO
      DisplayText.display_text(Content.menu(counter))
      case GetInput.get_input
      when '1'
        counter == Counter::ONE ? (players[0] = Player::Human.new(Marker::X)) : (players[1] = Player::Human.new(Marker::O))
      when '2'
        counter == Counter::TWO ? (players[1] = Player::Ai.new(Marker::O)) : (players[0] = Player::Ai.new(Marker::X))
      else
        puts "\nInvalid choice. Select #{MenuOption::ONE} or #{MenuOption::TWO} to start game:"
        get_player
      end
      counter += Counter::ONE
    end
    players
  end
end
