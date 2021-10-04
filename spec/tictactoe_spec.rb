require "tictactoe"
require 'stringio'

RSpec.describe Tic_Tac_Toe do
  
  describe "#show_board" do
    it "shows TTT board in terminal" do
      new_game = Tic_Tac_Toe.new
      board_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      board = ""
      board += "   |   |   \n"
      board += "-----------\n"
      board += "   |   |   \n"
      board += "-----------\n"
      board += "   |   |   "

      expect(new_game.show_board(board_spaces)).to eq(board)
    end
  end
  

  describe "#welcome_message" do
    it "returns welcome message and instructions" do
      new_game = Tic_Tac_Toe.new
      welcome_greeting = "-----------------------------\n"
      welcome_greeting += " WELCOME TO TIC-TAC-TOE\n"
      welcome_greeting += "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"

      expect(new_game.welcome_message()).to eq(welcome_greeting)
    end
  end
  

  describe "#take_turn" do
    it "check if alters board according to user input" do
      new_game = Tic_Tac_Toe.new
      board = new_game.board_spaces
      player1 = new_game.player1
      expected_output = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
      choice = 1

      expect{new_game.take_turn(board, choice)}.to change {board}.to(expected_output)
    end
  end

  describe "#check_for_winner" do
    it "return true if there is a winning combo on board" do
       game = Tic_Tac_Toe.new
       board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
       win_combos = [ [0,1,2] ]

       board2 = [" ", " ", " ", "X", "X", "X", " ", " ", " "]
       win_combos2 = [ [3,4,5] ]

       expect(game.check_for_winner?(board, win_combos)).to eq(true)
       expect(game.check_for_winner?(board2, win_combos2)).to eq(true)
    end
    
    it "return false if there is no winning combo on board" do
       game = Tic_Tac_Toe.new
       board = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
       win_combos = [ [0,1,2] ]

       expect(game.check_for_winner?(board, win_combos)).to eq(false)
    end
      
  end


#LAST END
end