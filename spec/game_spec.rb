require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/players/human'
require_relative '../lib/players/ai'

describe Game do
  before do
    allow($stdout).to receive(:puts)
    allow($stdin).to receive(:gets)

    @board = Board.new
    player_1 = Player::Human.new('X')
    player_2 = Player::Ai.new('O')
    @game = Game.new(@board, player_1, player_2)
  end
end
