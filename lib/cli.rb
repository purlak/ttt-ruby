require_relative './display_text.rb'
require_relative './content.rb'
class Cli
  def call
    clear_screen
    DisplayText.display_text(Content.welcome)
  end

  def clear_screen
    system('clear')
  end
end
