require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/players/human'
require_relative '../lib/players/ai'
require_relative '../lib/minimax'

describe Minimax do
  before do
    @board = Board.new
    @player_1 = Player::Human.new('X')
    @player_2 = Player::Ai.new('O')
    @game = Game.new(@board, @player_1, @player_2)
  end

  describe '#best move' do
    context 'Human plays first' do
      it 'Ai returns the best move when there are two moves left (example 1)' do
        @board.cells = [
          'X', 'O', 'X',
          'O', 'X', 'O',
          ' ', 'X', ' '
        ]

        expect(Minimax.new.move(@game)).to eq(7)
      end

      it 'Ai returns the best move when there are two moves left (example 2)' do
        @board.cells = [
          'X', 'X', 'O',
          'O', 'X', 'O',
          'X', ' ', ' '
        ]

        expect(Minimax.new.move(@game)).to eq(9)
      end

      it 'Ai returns the winning move when there are three moves left' do
        @board.cells = [
          'X', 'X', 'O',
          'O', 'X', 'O',
          ' ', ' ', ' '
        ]

        expect(Minimax.new.move(@game)).to eq(9)
      end

      it 'Ai returns center move as the first move when center is unoccupied' do
        @board.cells = [
          'X', ' ', ' ',
          ' ', ' ', ' ',
          ' ', ' ', ' '
        ]

        expect(Minimax.new.move(@game)).to eq(5)
      end

      it 'Ai returns blocking move when Human is in a position to win ' do
        @board.cells = [
          'X', ' ', ' ',
          ' ', 'O', ' ',
          'X', ' ', ' '
        ]

        expect(Minimax.new.move(@game)).to eq(4)
      end

      it 'Ai returns winning move against blocking move when Ai is in a position to win ' do
        @board.cells = [
          ' ', ' ', 'X',
          ' ', 'O', ' ',
          'X', 'O', 'X'
        ]

        expect(Minimax.new.move(@game)).to eq(2)
      end
    end

    context 'Ai plays first' do
      before do
        @player_1 = Player::Ai.new('X')
        @player_2 = Player::Human.new('O')
        @game = Game.new(@board, @player_1, @player_2)
      end

      it 'Ai returns winning move against blocking move when Ai is in a position to win ' do
        @board.cells = [
          'X', ' ', 'X',
          ' ', 'X', 'O',
          'O', ' ', 'O'
        ]

        expect(Minimax.new.move(@game)).to eq(2)
      end

      it 'Ai returns winning move against blocking move when Ai is in a position to win ' do
        @board.cells = [
          'X', ' ', 'O',
          ' ', 'X', 'X',
          'O', ' ', 'O'
        ]

        expect(Minimax.new.move(@game)).to eq(4)
      end

      it 'Ai returns winning move against blocking move when Ai is in a position to win ' do
        @board.cells = [
          'X', ' ', 'O',
          ' ', 'X', ' ',
          'X', 'O', 'O'
        ]

        expect(Minimax.new.move(@game)).to eq(4)
      end
    end
  end
end
