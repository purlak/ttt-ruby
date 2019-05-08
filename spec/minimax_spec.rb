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

  describe '#best_move' do
    it 'returns the best move when there are two moves left (example 1)' do
      @board.cells = [
        'X', 'O', 'X',
        'O', 'X', 'O',
        ' ', 'X', ' '
      ]

      expect(Minimax.new.move(@game)).to eq(7)
    end

    it 'returns the best move when there are two moves left (example 2)' do
      @board.cells = [
        'X', 'X', 'O',
        'O', 'X', 'O',
        'X', ' ', ' '
      ]

      expect(Minimax.new.move(@game)).to eq(9)
    end

    it 'returns the winning move when there are three moves left' do
      @board.cells = [
        'X', 'X', 'O',
        'O', 'X', 'O',
        ' ', ' ', ' '
      ]

      expect(Minimax.new.move(@game)).to eq(9)
    end

    it 'returns center move as the first move when center is unoccupied' do
      @board.cells = [
        'X', ' ', ' ',
        ' ', ' ', ' ',
        ' ', ' ', ' '
      ]

      expect(Minimax.new.move(@game)).to eq(5)
    end

    it 'returns blocking move when X is in a position to win ' do
      @board.cells = [
        'X', ' ', ' ',
        ' ', 'O', ' ',
        'X', ' ', ' '
      ]

      expect(Minimax.new.move(@game)).to eq(4)
    end
  end
end
