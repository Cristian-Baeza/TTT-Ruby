require "console_output"
require "game_logic"

RSpec.describe ConsoleOutput do
  
  describe "#welcome_message" do
    it "returns welcome message and instructions" do
      new_game = ConsoleOutput.new
      welcome_greeting = "-----------------------------\n"
      welcome_greeting += "WELCOME TO TIC-TAC-TOE\n"
      welcome_greeting += "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"

      expect(new_game.welcome_message()).to eq(welcome_greeting)
    end
  end

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