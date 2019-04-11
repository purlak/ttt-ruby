require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'

describe 'call' do
  before do
    allow($stdin).to receive(:gets)
    allow($stdout).to receive(:puts)
    @cli = Cli.new
  end

  it 'clears screen before printing menu' do
    expect(@cli).to receive(:clear_screen)
    allow(@cli).to receive(:gets).and_return('')
    @cli.call
  end

  it 'displays welcome message and marker options' do
    allow(@cli).to receive(:clear_screen)
    allow(@cli).to receive(:gets).and_return('')
    expect(@cli).to receive(:display_text).with(Content.welcome)
    expect(@cli).to receive(:display_text).with(Content.select_marker)
    @cli.call
  end
end

describe 'display_text' do
  before do
    @cli = Cli.new
  end

  it 'takes in a text argument displays text' do
    text = 'test'
    expect(@cli).to receive(:display_text).with(text).and_return(text)
    @cli.display_text(text)
  end
end
