require_relative '../lib/cli.rb'

describe 'call' do
  before do
    @cli = Cli.new
  end

  it 'displays menu and allows user to select marker' do
    allow(@cli).to receive(:clear_screen)
    expected =
      "Welcome to Tic Tac Toe!\n" +
      "Choose 'X' or 'O' to play game: \n"
    expect { @cli.call }.to output(expected).to_stdout
  end
end
