require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/human.rb'
require_relative '../lib/players/ai.rb'
require_relative '../lib/game_rules.rb'
require_relative '../lib/get_players.rb'

class FakeGetPlayers
  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def get
    [
      @player1,
      @player2
    ]
  end
end

describe 'Game' do
  context '#play' do
    it 'asks user for player choice' do
      board = Board.new
      allow(board).to receive(:display_board)
      board.cells =
        [
          'X', 'O', 'O',
          ' ', 'X', ' ',
          ' ', ' ', 'X'
        ]
      player1 = Player::Human.new('X')
      player2 = Player::Ai.new('O')
      rules = GameRules
      game = Game.new(board, player1, player2, rules)

      class FakeDisplayText
        def call(text); end
      end

      game.play(FakeGetPlayers.new(player1, player2), FakeDisplayText.new)

      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end
  end

  context '#current_player' do
    it 'returns current player' do
      board = Board.new
      player1 = Player::Human.new('X')
      player2 = Player::Ai.new('O')
      rules = GameRules
      game = Game.new(board, player1, player2, rules)

      expect(game.current_player).to eq(player1)
    end

    it 'does not return opponent' do
      board = Board.new
      player1 = Player::Human.new('X')
      player2 = Player::Ai.new('O')
      rules = GameRules
      game = Game.new(board, player1, player2, rules)

      expect(game.current_player).not_to eq(player2)
    end
  end
end
