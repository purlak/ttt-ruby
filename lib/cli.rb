require_relative './display_text.rb'
require_relative './content.rb'

class Cli
  attr_accessor :display_text

  def initialize(display_text = DisplayText.new)
    @display_text = display_text
  end

  def display_welcome_message
    clear_screen
    @display_text.call(Content.welcome)
  end

  def clear_screen
    system('clear')
  end
end
