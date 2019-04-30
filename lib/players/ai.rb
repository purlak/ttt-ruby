class Player::Ai < Player
  attr_accessor :board, :marker, :human_player

  def initialize(marker, human_player)
    @marker = marker
    @human_player = human_player
  end

  def move(board)
    @board = board
    Minimax.new.best_move(board, self, human_player)
  end
end
