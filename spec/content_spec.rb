require_relative '../lib/content.rb'

describe Content do
  it 'shows welcome message' do
    expect(Content.welcome).to eq('Welcome to Tic Tac Toe!')
  end

  it 'shows option to select marker' do
    expect(Content.select_marker).to eq("Choose 'X' or 'O' to play game:")
  end
end
