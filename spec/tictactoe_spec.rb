require "tictactoe"
require 'stringio'

RSpec.describe Tic_Tac_Toe do
  
  describe "#show_empty_board" do
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
      welcome_greeting = "WELCOME TO TIC-TAC-TOE\n"
      welcome_greeting += "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"

      expect(new_game.welcome_message()).to eq(welcome_greeting)
    end
  end
  


  describe "#validate_user_input" do
    it "returns valid message if input is X, otherwise notify user of of invalid input" do
      new_game = Tic_Tac_Toe.new
      player1_input = "X"
      valid_message = "GREAT CHOICE!"

      expect(new_game.validate_user_input(player1_input)).to eq(valid_message)
    end
    
    it "returns valid message if input is O, otherwise notify user of of invalid input" do
      new_game = Tic_Tac_Toe.new
      player2_input = "O"
      valid_message = "GREAT CHOICE!"

      expect(new_game.validate_user_input(player2_input)).to eq(valid_message)
    end
    
    it "returns invalid input message for invalid input" do
      new_game = Tic_Tac_Toe.new
      player_input = 2
      invalid_message = "INVALID INPUT: PLEASE CHOOSE X OR O"

      expect(new_game.validate_user_input(player_input)).to eq(invalid_message)
    end
  end


  describe "#take_turn" do
    it "check if alters board according to user input" do
      new_game = Tic_Tac_Toe.new
      board = new_game.board_spaces
      player1 = new_game.player1
      expected_output = ["X", " ", " ", " ", " ", " ", " ", " ", " "]

      allow(new_game).to receive(:gets).and_return("1")
      expect{new_game.take_turn(board, player1)}.to change {board}.to(expected_output)
    end
  end


end