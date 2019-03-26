class Cli
  def call
    system("clear")
    puts "Welcome to Tic Tac Toe!\n"
    puts menu
    user_input
  end

  def menu
    "Game Menu\n" +
    "1. Play Game\n" +
    "2. Game Instructions\n" +
    "3. Exit\n"
  end

  def user_input
    input = ""
    input = gets.strip
    while (input)
      case (input = '1')
        #Game.rb
      case (input = '2')
        #GameInstructions.rb
      case (input = '3')
        #break
      else
        #puts "Invalid choice. Try again"
      end
    end
  end
end
