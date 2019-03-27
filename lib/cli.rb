class Cli
  def call
    clear_screen
    puts "Welcome to Tic Tac Toe!\n"
    puts menu
  end

  def menu
    "Game Menu\n" +
    "1. Play Game\n" +
    "2. Game Instructions\n" +
    "3. Exit\n"
  end

  def clear_screen
    system("clear")
  end
end
