require_relative '../lib/game.rb'

describe 'game' do
  before do
    @game = Game.new
  end

  it 'initializes game with an empty array' do
    expect(@game.instance_variable_get(:@board)).to eq(Array.new(9))
  end

  it 'shows an empty board' do
    allow($stdout).to receive(:puts)
    expected = "  |  |  \n--------\n  |  |  \n--------\n  |  |  \n"
    expect { @game.display_board }.to output(expected).to_stdout
    @game.display_board
  end
end
