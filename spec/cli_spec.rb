require_relative '../lib/cli.rb'
require_relative '../lib/userInput.rb'

describe 'call' do
  it 'displays menu' do
    cli = Cli.new
    expected =
      "Welcome to Tic Tac Toe!\n" +
      "Game Menu\n" +
      "1. Play Game\n" +
      "2. Game Instructions\n" +
      "3. Exit\n"
    expect { cli.call }.to output(expected).to_stdout
  end

  it 'calls user_input' do
    cli = Cli.new
    expect { cli.call }.to respond_to(:user_input)
  end
end
