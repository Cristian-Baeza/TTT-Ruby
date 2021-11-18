require "game_logic"
require 'stringio'

RSpec.describe GameLogic do

  describe "#board_spaces" do

    it "converts :available to :empty" do
      game = GameLogic.new

      expect(game.board_spaces).to eq([:empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty])
    end

    it "converts :player_one to :X" do
      game = GameLogic.new

      game.take_turn(1)

      expect(game.board_spaces).to eq([:X, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty])
    end

    it "converts :player_two to :O" do
      game = GameLogic.new

      game.take_turn(1)
      game.take_turn(2)

      expect(game.board_spaces).to eq([:X, :O, :empty, :empty, :empty, :empty, :empty, :empty, :empty])
    end
  end

  describe "#take_turn" do
    it "check if alters board according to user input" do
      game = GameLogic.new
      expected_output = [:X, :empty, :empty, :empty, :empty, :empty, :empty, :empty, :empty]
      choice = 1

      expect{game.take_turn(choice)}.to change {game.board_spaces}.to(expected_output)
    end
  end

  describe "#is_there_winner" do
    it "it returns :X when :player_one is the winner" do
       game = GameLogic.new
      # checks horizontal win
       game.take_turn(1) #X
       game.take_turn(5) #O
       game.take_turn(3) #X
       game.take_turn(8) #O
       game.take_turn(2) #X

       expect(game.is_there_winner?()).to eq(:X)
    end

    it "it returns :O when :player_two is the winner" do
       game = GameLogic.new
      # checks horizontal win
       game.take_turn(1) #X
       game.take_turn(7) #O
       game.take_turn(3) #X
       game.take_turn(8) #O
       game.take_turn(4) #X
       game.take_turn(9) #O

       expect(game.is_there_winner?()).to eq(:O)
    end

    it "it returns nil when there is no winner" do
       game = GameLogic.new
      # checks horizontal win
       game.take_turn(1) #X

       expect(game.is_there_winner?()).to be_nil
    end
  end


    describe "#turn_count" do
      it "returns total number of board spaces used" do
          game = GameLogic.new
          game.take_turn(1)
          game.take_turn(2)
          game.take_turn(4)

          expect(game.turn_count()).to eq(3)
      end
    end

    describe "#current_player" do
      it "returns player X if spaces used on board is even" do
          game = GameLogic.new
          game.take_turn(1)
          game.take_turn(2)

          expect(game.current_player()).to eq(:X)
      end

      it "returns player O if spaces used on board is odd" do
          game = GameLogic.new
          game.take_turn(1)
          game.take_turn(2)
          game.take_turn(3)

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
        game.take_turn(1)
        game.take_turn(2)
        game.take_turn(3)
        expected_output = [4,5,6,7,8,9]

        expect(game.open_spaces).to eq(expected_output)
      end
    end

    describe "#board_full?" do
      it "returns true if board is full of player moves" do
        game = GameLogic.new
        game.take_turn(1)
        game.take_turn(2)
        game.take_turn(3)
        game.take_turn(4)
        game.take_turn(5)
        game.take_turn(6)
        game.take_turn(7)
        game.take_turn(8)
        game.take_turn(9)

        expect(game.board_full?).to eq(true)
      end

      it "returns false if board still has empty spaces" do
        game = GameLogic.new
        game.take_turn(1)
        game.take_turn(2)
        game.take_turn(3)

        expect(game.board_full?).to eq(false)
      end
    end

end
