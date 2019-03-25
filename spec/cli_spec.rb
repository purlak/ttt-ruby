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

describe 'Game Menu' do
  it 'displays header message "Game Menu"' do
    expect { print 'Game Menu' }.to output('Game Menu').to_stdout
  end

  it 'displays Option 1 "1. Play Game"' do
    expect { print '1. Play Game' }.to output('1. Play Game').to_stdout
  end

end
