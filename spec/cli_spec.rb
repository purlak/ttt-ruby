require_relative '../lib/cli.rb'

describe 'Welcome' do
  it 'displays welcome message "Welcome to Tic Tac Toe!"' do
    expect { print 'Welcome to Tic Tac Toe!' }.to output('Welcome to Tic Tac Toe!').to_stdout
  end

  it 'should call "menu"' do
    new_menu = TicTacToe.new
    expect(new_menu).to respond_to(:menu)
  end
end
