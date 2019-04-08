require_relative './content.rb'
require_relative './user_input.rb'
class Cli 
  def call
    clear_screen
    display_text(Content.welcome)
    display_text(Content.select_marker)
    UserInput.new 
  end

  def display_text(text)
    puts text + "\n\n"
  end 

  def clear_screen
    system("clear")
  end
end
