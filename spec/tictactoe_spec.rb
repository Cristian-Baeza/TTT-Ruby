require "tictactoe"
require 'stringio'

RSpec.describe Tic_Tac_Toe do
  
  describe "#show_board" do
    it "shows TTT board in terminal" do
      new_game = Tic_Tac_Toe.new
      board = ""
      board += "   |   |   \n"
      board += "-----------\n"
      board += "   |   |   \n"
      board += "-----------\n"
      board += "   |   |   "

      expect(new_game.show_board()).to eq(board)
    end
  end
  

  describe "#welcome_message" do
    it "returns welcome message and instructions" do
      new_game = Tic_Tac_Toe.new
      welcome_greeting = "-----------------------------\n"
      welcome_greeting += "WELCOME TO TIC-TAC-TOE\n"
      welcome_greeting += "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"

      expect(new_game.welcome_message()).to eq(welcome_greeting)
    end
  end
  

  describe "#take_turn" do
    it "check if alters board according to user input" do
      game = Tic_Tac_Toe.new
      player1 = game.player1
      expected_output = [player1, " ", " ", " ", " ", " ", " ", " ", " "]
      choice = 1

      expect{game.take_turn(choice)}.to change {game.board_spaces}.to(expected_output)
    end
  end

  describe "#check_for_winner" do
    it "return winner symbol if there is a horizontal winning combo on board" do
       game = Tic_Tac_Toe.new
      # checks horizontal win
       game.board_spaces[0] = "X" 
       game.board_spaces[1] = "X" 
       game.board_spaces[2] = "X"

       expect(game.check_for_winner?()).to eq("X")
    end
    
    it "return winner symbol if there is a diagonal winning combo on board" do
       game = Tic_Tac_Toe.new
      # checks diagonal
       game.board_spaces[2] = "X" 
       game.board_spaces[4] = "X" 
       game.board_spaces[6] = "X" 

       expect(game.check_for_winner?()).to eq("X")
    end
    
    it "return winner symbol if there is a vertical winning combo on board" do
       game = Tic_Tac_Toe.new
      # checks vertical win
       game.board_spaces[0] = "O" 
       game.board_spaces[3] = "O" 
       game.board_spaces[6] = "O" 

       expect(game.check_for_winner?()).to eq("O")
    end
    
    it "return false if there is no winning combo on board" do
       game = Tic_Tac_Toe.new
       game.board_spaces[0] = "X" 
       game.board_spaces[1] = "X" 

       expect(game.check_for_winner?()).to be_falsey
    end
  end


    describe "#turn_count" do
      it "returns total number of board spaces used" do
          game = Tic_Tac_Toe.new
          game.board_spaces[0] = "X" 
          game.board_spaces[1] = "O" 
          game.board_spaces[3] = "X" 
    
          expect(game.turn_count()).to eq(3)
      end
    end
    
    describe "#current_player" do
      it "returns player X if spaces used on board is even" do
          game = Tic_Tac_Toe.new
          game.board_spaces[0] = "X"
          game.board_spaces[1] = "O"
    
          expect(game.current_player()).to eq("PLAYER X")
      end
    
      it "returns player O if spaces used on board is odd" do
          game = Tic_Tac_Toe.new
          game.board_spaces[0] = "X"
          game.board_spaces[1] = "O"
          game.board_spaces[2] = "X"
    
          expect(game.current_player()).to eq("PLAYER O")
      end
    end
    
    
    describe "#position_taken" do
      it "returns true if user board space choice is taken" do
          game = Tic_Tac_Toe.new
          game.board_spaces[0] = "X"
          game.board_spaces[1] = "O"
          choice = 2
    
          expect(game.position_taken?(choice)).to be_truthy
      end
      
      it "returns false if user board space choice is not taken" do
          game = Tic_Tac_Toe.new
          game.board_spaces[0] = "X"
          game.board_spaces[1] = "O"
          choice = 3
          
          expect(game.position_taken?(choice)).to be_falsey
      end
    end
      




end