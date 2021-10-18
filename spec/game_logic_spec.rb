require "game_logic"
require 'stringio'

RSpec.describe GameLogic do
  
  describe "#take_turn" do
    it "check if alters board according to user input" do
      game = GameLogic.new
      expected_output = [:X, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
      choice = 1

      expect{game.take_turn(choice)}.to change {game.board_spaces}.to(expected_output)
    end
  end

  describe "#is_there_winner" do
    it "return winner symbol if there is a horizontal winning combo on board" do
       game = GameLogic.new
      # checks horizontal win
       game.board_spaces[0] = :X 
       game.board_spaces[1] = :X 
       game.board_spaces[2] = :X

       expect(game.is_there_winner?()).to eq(:X)
    end
    
    it "return winner symbol if there is a diagonal winning combo on board" do
       game = GameLogic.new
      # checks diagonal
       game.board_spaces[2] = :X 
       game.board_spaces[4] = :X 
       game.board_spaces[6] = :X 

       expect(game.is_there_winner?()).to eq(:X)
    end
    
    it "return winner symbol if there is a vertical winning combo on board" do
       game = GameLogic.new
      # checks vertical win
       game.board_spaces[0] = :O 
       game.board_spaces[3] = :O 
       game.board_spaces[6] = :O 

       expect(game.is_there_winner?()).to eq(:O)
    end
    
    it "return false if there is no winning combo on board" do
       game = GameLogic.new
       game.board_spaces[0] = :X 
       game.board_spaces[1] = :X 

       expect(game.is_there_winner?()).to be_falsey
    end
  end


    describe "#turn_count" do
      it "returns total number of board spaces used" do
          game = GameLogic.new
          game.board_spaces[0] = :X 
          game.board_spaces[1] = :O 
          game.board_spaces[3] = :X 
    
          expect(game.turn_count()).to eq(3)
      end
    end
    
    describe "#current_player" do
      it "returns player X if spaces used on board is even" do
          game = GameLogic.new
          game.board_spaces[0] = :X
          game.board_spaces[1] = :O
    
          expect(game.current_player()).to eq(:X)
      end
    
      it "returns player O if spaces used on board is odd" do
          game = GameLogic.new
          game.board_spaces[0] = :X
          game.board_spaces[1] = :O
          game.board_spaces[2] = :X
    
          expect(game.current_player()).to eq(:O)
      end
    end

    describe "#open_spaces" do
      it "returns array of all available spaces to play for empty board" do
        game = GameLogic.new 
        expected_output = [1,2,3,4,5,6,7,8,9]

        expect(game.open_spaces).to eq(expected_output)
      end
      
      it "returns only available spaces to play" do
        game = GameLogic.new
        game.board_spaces[0] = :X
        game.board_spaces[1] = :O
        game.board_spaces[2] = :X
        expected_output = [4,5,6,7,8,9]

        expect(game.open_spaces).to eq(expected_output)
      end
    end

end