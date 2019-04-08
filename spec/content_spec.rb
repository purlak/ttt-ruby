require_relative '../lib/content.rb'
describe 'content' do 
  it "shows menu" do 
  	expect(Content.menu).to eq("Welcome to Tic Tac Toe!")
	end

	it "shows option to select marker" do
		expect(Content.select_marker).to eq("Choose 'X' or 'O' to play game:")
	end 
end 