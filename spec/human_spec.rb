require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/human.rb'

describe Player::Human do
  before do
    @human = Player::Human.new("X")
  end

  it 'inherits from Player class' do
    expect(Player::Human.ancestors).to include(Player)
  end

  describe 'move' do
    it 'asks the user for input and returns it' do      
      expect(@human).to receive(:gets).and_return("1")

      expect(@human.move([])).to eq("1")
    end
  end
end
