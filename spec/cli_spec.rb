require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'
require_relative '../lib/display_text.rb'

describe Cli do
  before do
    allow($stdout).to receive(:puts)
  end

  describe '#display_welcome_message' do
    it 'clears screen before printing welcome message' do
      class FakeDisplayText
        def call(text); end
      end

      cli = Cli.new(FakeDisplayText.new)

      expect(cli).to receive(:clear_screen)

      cli.display_welcome_message
    end

    it 'displays welcome message' do
      class FakeDisplayText
        attr_accessor :called

        def initialize
          @called = false
        end

        def call(_message)
          @called = true
        end
      end

      fake_display_text = FakeDisplayText.new

      cli = Cli.new(fake_display_text)

      allow(cli).to receive(:clear_screen)

      expect(fake_display_text.called).to eq(false)
      cli.display_welcome_message
      expect(fake_display_text.called).to eq(true)
    end
  end
end
