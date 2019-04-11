require_relative '../lib/game.rb'

describe 'game' do
  before do
    allow($stdin).to receive(:gets)
    allow($stdout).to receive(:puts)
    @game = Game.new
  end

  it 'initializes game with an empty array' do
    expect(@game.instance_variable_get(:@board)).to eq(Array.new(9))
  end

  describe 'call' do
    it 'calls user input' do
      expect(@game).to receive(:user_input)
      @game.call
    end

    it 'shows an empty board' do
      allow($stdout).to receive(:puts)
      expected = "  |  |  \n--------\n  |  |  \n--------\n  |  |  \n"
      expect { @game.display_board }.to output(expected).to_stdout
      @game.display_board
    end
  end

  describe 'user_input' do
    it 'asks the user for input' do
      allow(@game).to receive(:gets).and_return('X')
      @game.user_input
    end
  end
end
