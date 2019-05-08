require_relative '../lib/board.rb'

describe Board do
  it 'shows an empty board' do
    expected = "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"

    expect { subject.display_board }.to output(expected).to_stdout
  end

  it 'initializes board with an empty array' do
    expect(subject.instance_variable_get(:@cells)).to eq(Array.new(9, ' '))
  end
end
