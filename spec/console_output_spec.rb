require "console_output"
require "game_logic"

RSpec.describe ConsoleOutput do

  describe "#show_board" do
    it "shows TTT board in terminal" do
      ttt_game = GameLogic.new
      new_game = ConsoleOutput.new
      board = ""
      board += "   |   |  \n"
      board += "-----------\n"
      board += "   |   |  \n"
      board += "-----------\n"
      board += "   |   |  "

      expect(new_game.show_board(ttt_game)).to eq(board)
    end
  end
  
end