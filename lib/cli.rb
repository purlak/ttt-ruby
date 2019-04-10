require_relative './content.rb'
require_relative './game.rb'

class Cli
  def call
    clear_screen
    display_text(Content.welcome)
    display_text(Content.select_marker)
    user_input
  end

  def display_text(text)
    puts "#{text}\n\n"
  end

  def clear_screen
    system('clear')
  end

  def user_input
    gets.chomp
    Game.new.empty_board
  end
end
