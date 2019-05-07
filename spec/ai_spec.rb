require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/ai.rb'

describe Player::Ai do
  before do
    board = Board.new
    human = Player::Human.new('X')
    @ai = Player::Ai.new('O')
    @game = Game.new(board, human, @ai)
  end

  describe 'move' do
    it 'returns a valid position for Ai to move' do
      valid_moves = [1,2,3,4,5,6,7,8,9]

      expect(valid_moves).to include(@ai.move(@game))
    end
  end
end
