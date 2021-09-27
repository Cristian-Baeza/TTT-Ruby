require "tictactoe"

RSpec.describe Tic_Tac_Toe do
  
  describe '#run_app' do
    it 'returns the sum of its arguments' do
      expect{Tic_Tac_Toe.new.run_app()}.to output(/Welcome to Tic-Tac-Toe/).to_stdout
    end
  end

  describe "#show_empty_board" do
    it "shows empty TTT board in terminal" do
      new_game = Tic_Tac_Toe.new
      row = "   " +  "|" +  "   " + "|" + "   "
      separator = "-----------"
      board = row + "\n" + separator + "\n" + row + "\n" + separator + "\n" + row

      expect{new_game.show_empty_board()}.to output(/#{board}/).to_stdout
    end
  end

end