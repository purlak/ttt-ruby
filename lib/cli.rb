class Cli
  def call
    clear_screen
    puts menu
    puts select_marker
  end

  def menu
    "Welcome to Tic Tac Toe!\n"
  end

  def select_marker
    "Choose 'X' or 'O' to play game: \n"
  end

  def clear_screen
    system("clear")
  end
end
