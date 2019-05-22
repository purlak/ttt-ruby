require_relative './moves.rb'
require_relative './display_text.rb'
require_relative './content.rb'
require_relative './menu_option.rb'
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
    counter = 1
    while counter <= 2
      DisplayText.display_text(Content.menu(counter))
      case GetInput.get_input
      when '1'
        if counter == 1
          players[0] = Player::Human.new(Marker::X)
        else
          players[1] = Player::Human.new(Marker::O)
        end
      when '2'
        if counter == 2
          players[1] = Player::Ai.new(Marker::O)
        else
          players[0] = Player::Ai.new(Marker::X)
        end
      else
        puts "\nInvalid choice. Select #{MenuOption::ONE} or #{MenuOption::TWO} to start game:"
        get_player
      end
      counter += 1
    end
    players
  end
end
