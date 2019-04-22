class Player::Human < Player
  def move(board)
    puts "Enter board position [1-9]"
    gets.chomp
  end
end
