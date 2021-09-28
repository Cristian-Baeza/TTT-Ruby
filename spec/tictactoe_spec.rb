require "tictactoe"

RSpec.describe Tic_Tac_Toe do
  
  describe "#show_empty_board" do
    it "shows empty TTT board in terminal" do
      new_game = Tic_Tac_Toe.new
      row = "   " +  "|" +  "   " + "|" + "   "
      separator = "-----------"
      board = row + "\n" + separator + "\n" + row + "\n" + separator + "\n" + row

      expect(new_game.show_empty_board()).to eq(board)
    end
  end

end