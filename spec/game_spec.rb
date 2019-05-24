require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/human.rb'
require_relative '../lib/players/ai.rb'
require_relative '../lib/game_rules.rb'
require_relative '../lib/get_players.rb'

describe 'Game' do
  context '#play' do
    xit 'asks user for player choice' do
      board = Board.new
      player1 = Player::Human.new('X')
      player2 = Player::Ai.new('O')
      rules = GameRules
      game = Game.new(board, player1, player2, rules)

      class FakeGetPlayers
        def get
          [
            :player_1,
            :player_2
          ]
        end
      end

      game.play(FakeGetPlayers.new)
      expect(game.player1).to eq(:player_1)
      expect(game.player2).to eq(:player_2)
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
