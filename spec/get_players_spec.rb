require_relative '../lib/get_players.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/human.rb'
require_relative '../lib/players/ai.rb'
require_relative '../lib/marker.rb'
require_relative '../lib/content.rb'

describe 'GetPlayers' do
  class FakeGetInput
    def initialize(choices)
      @choices = choices
    end

    def call
      @choices.pop
    end
  end

  class FakeDisplayText
    def call(text); end
  end

  context '#get' do
    it 'displays menu' do
      expect do
        GetPlayers.get(FakeGetInput.new(['1']))
      end.to output(Content.menu(1) + Content.menu(2)).to_stdout
    end

    it 'asks user to select player1 as human' do
      players = GetPlayers.get(FakeGetInput.new(['1']), FakeDisplayText.new)
      player_1 = players[0]

      expect(player_1).to be_instance_of(Player::Human)
      expect(player_1.marker).to eq(Marker::X)
    end

    it 'asks user to select player1 as ai' do
      players = GetPlayers.get(FakeGetInput.new(['2']), FakeDisplayText.new)
      player_1 = players[0]

      expect(player_1).to be_instance_of(Player::Ai)
      expect(player_1.marker).to eq(Marker::X)
    end

    it 'asks user to select player2 as human' do
      players = GetPlayers.get(FakeGetInput.new(%w[1 1]), FakeDisplayText.new)
      player_2 = players[1]

      expect(player_2).to be_instance_of(Player::Human)
      expect(player_2.marker).to eq(Marker::O)
    end
  end
end
