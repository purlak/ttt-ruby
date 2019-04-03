require_relative './content.rb'

class Cli

  def initialize (lang)
    @content = lang
  end

  def call
    clear_screen
    # puts menu
    # puts select_marker
    @content.menu
    @content.select_marker
  end
  #
  # def menu
  #   "Welcome to Tic Tac Toe!\n"
  # end
  #
  # def select_marker
  #   "Choose 'X' or 'O' to play game: \n"
  # end

  def clear_screen
    system("clear")
  end
end
