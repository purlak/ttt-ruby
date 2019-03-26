require_relative '../lib/cli.rb'

describe 'call' do
  it 'displays welcome message and menu' do
    cli = Cli.new
    expected =
      "Welcome to Tic Tac Toe!\n" +
      "Game Menu\n" +
      "1. Play Game\n" +
      "2. Game Instructions\n" +
      "3. Exit\n"
    expect { cli.call }.to output(expected).to_stdout
  end
end
