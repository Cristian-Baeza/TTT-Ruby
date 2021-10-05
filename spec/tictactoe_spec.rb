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
    it "return winner symbol if there is a winning combo on board" do
       game = Tic_Tac_Toe.new

       # checks horizontal win
       winning_board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
       #checks diagonal win
       winning_board2 = [" ", " ", "X", " ", "X", " ", "X", " ", " "]
       #checks vertical column 
       winning_board3 = ["O", " ", " ", "O", " ", " ", "O", " ", " "]

       expect(game.check_for_winner?(winning_board)).to eq("X")
       expect(game.check_for_winner?(winning_board2)).to eq("X")
       expect(game.check_for_winner?(winning_board3)).to eq("O")
    end
    
    it "return false if there is no winning combo on board" do
       game = Tic_Tac_Toe.new

       no_winning_board = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
       no_winning_board2 = ["O", "X", "O", "O", "X", "O", "X", "O", "X"]

       expect(game.check_for_winner?(no_winning_board)).to be_falsey
       expect(game.check_for_winner?(no_winning_board2)).to be_falsey
    end
      
  end



end