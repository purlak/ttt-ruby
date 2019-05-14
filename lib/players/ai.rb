class Player::Ai < Player
  def move(game)
     Minimax.new.move(game)
  end
end
