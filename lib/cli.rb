class TicTacToe
  def call
    system("clear")
    puts "Welcome to Tic Tac Toe!"
    puts "\n"
    menu
    user_input
  end

  def menu
    puts "Game Menu "
    puts "1. Play Game"
    puts "2. Game Instructions"
    puts "3. Exit"
    puts "\n"
  end

  def user_input
    input = ""
    while input
      puts "Enter your option:"
      input = gets.strip
      case input
        when "1"
          DisplayBoard.new.call
        when "2"
          GameInstructions.new.call
        when "3"
          puts "Goodbye! See you soon."
          puts "\n"
          exit
        else
          puts "Invalid choice. Try again!"
          puts "\n"
          menu
      end
    end
  end

end
