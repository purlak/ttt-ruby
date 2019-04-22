require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'

describe Cli do
  before do
    allow($stdout).to receive(:puts)
  end

  describe 'call' do
    it 'clears screen before printing menu' do
      expect(subject).to receive(:clear_screen)

      subject.call
    end

    it 'takes in a text argument displays text' do
      text = 'test'

      expect(subject).to receive(:display_text).with(text).and_return(text)

      subject.display_text(text)
    end

    it 'displays welcome message and menu options' do
      allow(subject).to receive(:clear_screen)
      expected = "Welcome to Tic Tac Toe!\n\nSelect your game:\n1. Human v. Human\n2. Human v. Computer\n\n"

      expect do
        subject.call
      end.to output(expected).to_stdout
    end
  end
end
