require_relative '../lib/cli.rb'
require_relative '../lib/content.rb'
require 'pry'

describe 'call' do
  before do
    allow($stdout).to receive(:puts)
    @cli = Cli.new
  end

  it 'clears screen before printing menu' do
    expect(@cli).to receive(:clear_screen)
    @cli.call
  end

  it 'displays welcome message and marker options' do
    allow(@cli).to receive(:clear_screen)
    expect(@cli).to receive(:display_text).with(Content.welcome)
    expect(@cli).to receive(:display_text).with(Content.select_marker)
    @cli.call
  end

  it 'displays text' do
    text = "test"
    expect(@cli).to receive(:display_text).with(text).and_return(text)
    @cli.display_text(text)
  end 
end
