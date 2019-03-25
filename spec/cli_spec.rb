require_relative '../lib/cli.rb'

describe 'Welcome' do
  it 'displays welcome message "Welcome to Tic Tac Toe!"' do
    expect { print 'Welcome to Tic Tac Toe!' }.to output('Welcome to Tic Tac Toe!').to_stdout
  end

  it 'should call "menu"' do
    cli = Cli.new
    expect(cli).to respond_to(:menu)
  end
end

describe 'Game Menu' do
  it 'displays header message "Game Menu"' do
    expect { print 'Game Menu' }.to output('Game Menu').to_stdout
  end

  it 'displays Option 1' do
    expect { print '1. Play Game' }.to output('1. Play Game').to_stdout
  end

  it 'displays Option 2' do
    expect { print '2. Game Instructions' }.to output('2. Game Instructions').to_stdout
  end

  it 'displays Option 3' do
    expect { print '3. Exit' }.to output('3. Exit').to_stdout
  end
end
