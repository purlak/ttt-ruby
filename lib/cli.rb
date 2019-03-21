class TicTacToe
  def call
    system("clear")
    puts "\n Welcome to Tic Tac Toe!"
    menu
    user_input
  end

  def menu
    puts "\n Here are your menu options:"
    puts "1. Play Game"
    puts "2. Exit"
  end

  def user_input
    input = ""
    while input
      puts "Enter your option:"
      input = gets.chomp
      case input
        when "1"
          display_board()
        when "2"
          puts "Goodbye!"
          exit
        else
          puts "Invalid choice. Try again!"
          menu
      end
    end
  end

end
