require_relative '../lib/content.rb'

describe 'content' do
  before do
    allow($stdout).to receive(:puts)
    @content = Content.new
  end

  it 'displays text for menu' do
    expected = "Welcome to Tic Tac Toe!\n"
    expect { @content.menu }.to output(expected).to_stdout
  end

  it 'displays text to select marker' do
    expected = "Choose 'X' or 'O' to play game: \n"
    expect { @content.select_marker }.to output(expected).to_stdout
  end
end
