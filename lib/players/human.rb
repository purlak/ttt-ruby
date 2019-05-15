require_relative '../get_input.rb'
class Player::Human < Player
  def move(_game)
    puts 'Enter board position [1-9]:'
    GetInput.get_input
    # gets.chomp
  end
end
