class Cli
  def call
    puts menu
  end

  def menu
    "Welcome to Tic Tac Toe!\n"
  end

  def clear_screen
    system("clear")
  end
end
