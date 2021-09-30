require "tictactoe"
require 'questions'
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
      welcome_greeting = "-----------------------------\n"
      welcome_greeting += " WELCOME TO TIC-TAC-TOE\n"
      welcome_greeting += "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"

      expect(new_game.welcome_message()).to eq(welcome_greeting)
    end
  end
  


  describe "#validate_user_input" do
    it "returns the value the user picked and change to integer" do
        questions = Questions.new
        allow(questions).to receive(:gets).and_return("1\n")

        answer = questions.validate_user_input("PICK A SPACE?", ["1", "2", "3", "4", "5", "6", "7", "8", "9"])

        expect(answer).to eq(1)
    end

    it "it loops asking the question until it gets a valid answer" do
        question = "PICK A SPACE?"
        options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        questions = Questions.new

        allow(questions).to receive(:gets).and_return("10\n", "1\n")
        expect(questions).to receive(:puts).twice.with(question)
        expect(questions).to receive(:puts).with("INVALID OPTION")

        answer = questions.validate_user_input(question, options)

        expect(answer).to eq(1)
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


end