#spec/calculator_spec.rb
require_relative '../lib/game_logic'

game = Game.new
player = game.register_player("george")
board = Board.new


describe Board do
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
    it "Raise error with wrong index" do
      expect {board.cell(5, 4)}.to raise_error StandardError
    end
  end

  describe "#printable_board"do
    it "Returns the same value as board.interface_board" do
      expect(board.printable_board).to eql(board.interface_board)
    end
    it "Returns diferent object as board.interface_board" do
      expect(board.printable_board).not_to equal(board.interface_board)
    end
    it "Does not return nil" do
      expect(board.printable_board).not_to be_nil
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
    it "Raise error with wrong index" do
      expect {board1.update_board(5, 4, "X")}.to raise_error StandardError
    end
  end

  describe "#calculate_index" do
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(1)).to eql([0, 0])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(2)).to eql([0, 1])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(3)).to eql([0, 2])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(4)).to eql([1, 0])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(5)).to eql([1, 1])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(6)).to eql([1, 2])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(7)).to eql([2, 0])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(8)).to eql([2, 1])
    end
    it 'returns the position on the board in form of index' do
      expect(board.calculate_index(9)).to eql([2, 2])
    end
    it "Raise error with wrong input" do
      expect {board.calculate_index(10)}.to raise_error StandardError
    end
  end
end

describe Player do
  describe "#update_player_board" do
    it "returns updated player board" do
      expect(player.update_player_board(0, 0, 67)).to eql(6767)
    end
    it "Raise error with wrong index" do
      expect {player.update_player_board(5, 4, "X")}.to raise_error StandardError
    end
  end

  describe "#winner?" do
    it "Returns that the current player won" do
      player.update_player_board(0, 1, 1)
      player.update_player_board(0, 2, 43)
      expect(player.winner?(board.magic_number)).to eql(true)
    end
    it "returns that no player won" do
      player.update_player_board(0, 0, 0)
      player.update_player_board(0, 1, 0)
      player.update_player_board(0, 2, 0)
      expect(player.winner?(board.magic_number)).to eql(false)
    end
  end
end

describe Game do
  describe "#register_player" do
    it "check that the method works" do
      expect(game.register_player("george")).to be_nil
    end
    it "Raise error without an argument" do
      expect {game.register_player}.to raise_error StandardError
    end
  end

  describe "#last_registered_player" do
    it "returns the last registered the player" do
      expect(game.last_registered_player.name).to eql("george")
    end
    it "Does not return a non registered the player" do
      expect(game.last_registered_player.name).not_to eql("JP")
    end
  end

  describe "#board" do
    it "returns the printable board" do
      expect(game.board).to eql(board.interface_board)
    end

    it "does not return nil" do
      expect(game.board).not_to be_nil
    end
  end

  describe "#execute_turn" do
    it "Return true when a player wins" do
      player.update_player_board(0, 0, 67)
      player.update_player_board(0, 1, 1)
      player.update_player_board(0, 2, 43)
      expect(game.execute_turn(3)).to eql(true)
    end
    it "Return false when no player won" do
      player.update_player_board(0, 0, 0)
      player.update_player_board(0, 1, 0)
      player.update_player_board(0, 2, 0)
      expect(game.execute_turn(1)).to eql(false)
    end
  end
end
