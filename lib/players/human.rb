class Player::Human < Player
  def move(_board, _game)
    puts 'Enter board position [1-9]:'
    gets.chomp
  end
end
