require_relative './display_text.rb'
require_relative './content.rb'
class Cli
  def call(m)
    clear_screen
    m.call(Content.welcome)
  end

  def clear_screen
    system('clear')
  end
end
