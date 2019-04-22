require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/ai.rb'

describe Player::Ai do
  before do
    @board = Board.new
    @ai = Player::Ai.new("O")
  end
  it 'inherits from Player class' do
    expect(Player::Ai.ancestors).to include(Player)
  end

  describe 'move' do
    it 'returns a valid position for the computer to move' do
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      ai_move = @ai.move(@board)

      expect(valid_moves).to include(ai_move)
    end
  end
end
