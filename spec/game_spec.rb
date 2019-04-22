require_relative '../lib/game.rb'
describe Game do
  before do
    allow($stdout).to receive(:puts)
  end

  # it 'initializes game with an empty array' do
  #   expect(subject.instance_variable_get(:@board)).to eq(Array.new(9))
  # end
  #
  # describe 'call' do
  #   it 'calls user input' do
  #     allow(subject).to receive(:turn)
  #     expect(subject).to receive(:user_input)
  #
  #     subject.call
  #   end
  #
  #   it 'shows an empty board' do
  #     expected = "  |  |  \n--------\n  |  |  \n--------\n  |  |  \n"
  #
  #     expect { subject.display_board }.to output(expected).to_stdout
  #   end
  #
  #   it 'calls turn' do
  #     allow(subject).to receive(:gets).and_return('')
  #
  #     expect(subject).to receive(:turn)
  #
  #     subject.call
  #   end
  # end
  #
  # describe 'user_input' do
  #   it 'asks the user for input' do
  #     allow(subject).to receive(:gets).and_return('')
  #
  #     subject.user_input
  #   end
  # end
end
