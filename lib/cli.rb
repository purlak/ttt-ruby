class Cli
  def call
    system("clear")
    puts "Welcome to Tic Tac Toe!"
    puts "\n"
    menu
  end

  def menu
    puts "Game Menu"
    puts "1. Play Game"
    puts "2. Game Instructions"
    puts "3. Exit"
    puts "\n"
  end
end
