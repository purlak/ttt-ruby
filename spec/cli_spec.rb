require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'
require_relative '../lib/display_text.rb'

describe Cli do
  before do
    allow($stdout).to receive(:puts)
  end

  describe 'call' do
    it 'clears screen before printing menu' do
      expect(subject).to receive(:clear_screen)

      subject.call(DisplayText.method(:display_text))
    end

    it 'displays welcome message' do
      allow(subject).to receive(:clear_screen)
      expected = "Welcome to Tic Tac Toe!\n\n"

      expect do
        subject.call(m = DisplayText.method(:display_text))
      end.to output(expected).to_stdout
    end
  end
end
