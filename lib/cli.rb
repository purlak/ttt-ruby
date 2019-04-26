require_relative './content.rb'
require_relative './game.rb'

class Cli
  def call
    clear_screen
    display_text(Content.welcome)
    display_text(Content.menu)
  end

  def display_text(text)
    puts "#{text}\n\n"
  end

  def clear_screen
    system('clear')
  end
end
