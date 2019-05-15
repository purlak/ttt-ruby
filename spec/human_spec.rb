require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/human.rb'

describe Player::Human do
  before do
    allow($stdin).to receive(:gets)
    allow($stdout).to receive(:puts)
    @human = Player::Human.new('X')
  end

  describe 'move' do
    it 'asks the user for input and returns it' do
      expect(@human).to receive(:move).and_return('1')

      expect(@human.move([])).to eq('1')
    end
  end
end
