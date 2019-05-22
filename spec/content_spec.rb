require_relative '../lib/content.rb'

describe Content do
  it 'shows welcome message' do
    expect(Content.welcome).to eq('Welcome to Tic Tac Toe!')
  end
end
