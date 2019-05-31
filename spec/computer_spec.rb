require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/players/computer.rb'
require_relative '../lib/players/human.rb'

describe Player::Computer do
  before do
    @board = Board.new
    @comp = Player::Computer.new('O')
    @human = Player::Human.new('X')
  end

  describe 'move' do
    it 'returns a valid position for the computer to move' do
      valid_moves = %w[1 2 3 4 5 6 7 8 9]

      expect(valid_moves).to include(@comp.move(@board, @human, @comp))
    end

    describe 'winning move' do
      it 'Example 1 - Computer selects position 8 to win' do
        @board.cells = ['X', 'O', 'X', 'X', 'O', ' ', 'O', ' ', 'X']

        expect(@comp.move(@board, @human, @comp)).to eq('8')
      end

      it 'Example 2 - Computer selects position 6 to win' do
        @board.cells = ['X', ' ', ' ', 'O', 'O', ' ', 'X', ' ', 'X']

        expect(@comp.move(@board, @human, @comp)).to eq('6')
      end

      it 'Example 3 - Computer selects position 4 to win' do
        @board.cells = ['X', ' ', 'X', ' ', 'O', 'O', ' ', ' ', 'X']

        expect(@comp.move(@board, @human, @comp)).to eq('4')
      end
    end

    describe 'blocking move' do
      it 'Example 1 - Computer selects position 3 to block' do
        @board.cells = ['X', 'X', ' ', ' ', 'O', ' ', ' ', ' ', ' ']

        expect(@comp.move(@board, @human, @comp)).to eq('3')
      end

      it 'Example 2 - Computer selects position 8 to block' do
        @board.cells = ['O', 'X', ' ', ' ', 'X', ' ', ' ', ' ', ' ']

        expect(@comp.move(@board, @human, @comp)).to eq('8')
      end
    end
  end
end
