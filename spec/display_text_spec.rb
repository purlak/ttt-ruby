require_relative '../lib/display_text'

describe 'DisplayText' do
  it 'displays text' do
    display_text = DisplayText.new

    expect do
      display_text.call("foo")
    end.to output("foo").to_stdout
  end
end
