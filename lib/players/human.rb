require_relative '../get_input.rb'
class Player::Human < Player
  def move(_board, _player1, _player2)
    puts 'Enter board position [1-9]:'
    GetInput.get_input
  end
end
