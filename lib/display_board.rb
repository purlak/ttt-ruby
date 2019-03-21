
class DisplayBoard
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def call
    system("clear")
    display_board(@board)
  end

  def display_board(board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    choose_marker
  end

  def choose_marker
    input = ""
    puts "Choose Marker (X or O)"
    input = gets.strip
    binding.pry
  end
end
