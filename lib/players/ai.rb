class Player::Ai < Player
  def move(game)
    input = Minimax.new.move(game)
  end
end
