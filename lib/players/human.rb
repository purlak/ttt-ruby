require_relative '../get_input.rb'
class Player::Human < Player
  include GetInput
  def move(_game)
    puts 'Enter board position [1-9]:'
    get_input
  end
end
