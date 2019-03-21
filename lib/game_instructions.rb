class GameInstructions

  def call
    system("clear")
    display_instructions
  end

  def display_instructions
    puts "\n"
    puts "Tic-tac-toe (American English), noughts and crosses (British English) or Xs and Os, is a paper-and-pencil game for two players, X and O, who take turns marking the spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game."
    puts "Source: https://en.wikipedia.org/wiki/Tic-tac-toe"
    menu_options
  end

  def menu_options
    puts "\n"
    puts "To continue, select your option below:"
    TicTacToe.new.menu
  end

end
