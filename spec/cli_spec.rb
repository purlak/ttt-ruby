require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'

describe 'call' do
  let(:content) { double(select_marker: "") }
  let(:cli) { Cli.new(content) }

  before do
    expect(cli).to receive(:clear_screen)
  end

  it 'displays menu and allows user to select marker' do
    # expected =
    #   "Welcome to Tic Tac Toe!\n" +
    #   "Choose 'X' or 'O' to play game: \n"
    expect(content).to receive(:menu)
    expect(content).to receive(:select_marker).and_return("whatever")

    cli.call
  end
end
