#spec/calculator_spec.rb
require './lib/game_logic'

describe Board do
  board = Board.new
  describe "#cell" do
    it "returns the cell number based on the index 0, 0" do
      expect(board.cell(0, 0)).to eql(67)
    end
    it "returns the cell number based on the index 0, 1" do
      expect(board.cell(0, 1)).to eql(1)
    end
    it "returns the cell number based on the index 0, 2" do
      expect(board.cell(0, 2)).to eql(43)
    end
    it "returns the cell number based on the index 1, 0" do
      expect(board.cell(1, 0)).to eql(13)
    end
    it "returns the cell number based on the index 1, 1" do
      expect(board.cell(1, 1)).to eql(37)
    end
    it "returns the cell number based on the index 1, 2" do
      expect(board.cell(1, 2)).to eql(61)
    end
    it "returns the cell number based on the index 2, 0" do
      expect(board.cell(2, 0)).to eql(31)
    end
    it "returns the cell number based on the index 2, 1" do
      expect(board.cell(2, 1)).to eql(73)
    end
    it "returns the cell number based on the index 2, 2" do
      expect(board.cell(2, 2)).to eql(7)
    end
  end

  describe "#printable_board"do
    it "Returns the same value as board.interface_board" do
      expect(board.printable_board).to eql(board.interface_board)
    end
    it "Returns diferent object as board.interface_board" do
      expect(board.printable_board).not_to equal(board.interface_board)
    end
  end

  describe "#update_board" do
    board1 = Board.new
    it "Changes the cell number based on the index 0, 0" do
      board1.update_board(0, 0, "X")
      expect(board1.interface_board).to eql([%w[X 2 3], %w[4 5 6], %w[7 8 9]])
    end
    it "returns the cell number based on the index 0, 1" do
      board1.update_board(0, 1, "X")
      expect(board1.interface_board).to eql([%w[X X 3], %w[4 5 6], %w[7 8 9]])
    end
    it "returns the cell number based on the index 0, 2" do
      board1.update_board(0, 2, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[4 5 6], %w[7 8 9]])
    end
    it "returns the cell number based on the index 1, 0" do
      board1.update_board(1, 0, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X 5 6], %w[7 8 9]])
    end
    it "returns the cell number based on the index 1, 1" do
      board1.update_board(1, 1, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X X 6], %w[7 8 9]])
    end
    it "returns the cell number based on the index 1, 2" do
      board1.update_board(1, 2, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X X X], %w[7 8 9]])
    end
    it "returns the cell number based on the index 2, 0" do
      board1.update_board(2, 0, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X X X], %w[X 8 9]])
    end
    it "returns the cell number based on the index 2, 1" do
      board1.update_board(2, 1, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X X X], %w[X X 9]])
    end
    it "returns the cell number based on the index 2, 2" do
      board1.update_board(2, 2, "X")
      expect(board1.interface_board).to eql([%w[X X X], %w[X X X], %w[X X X]])
    end
  end
end

describe Player do

end

describe Game do

end
