class Player::Ai < Player
  def move(board, player1, player2)
    Minimax.new.move(board, player1, player2)
  end
end
