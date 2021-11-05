require 'computer_logic/computer_logic_easy'
require "game_logic"


RSpec.describe ComputerLogicEasy do

  describe "#cpu_turn" do
    it "fills in one spot on board" do
      game = GameLogic.new
      computer_logic = ComputerLogicEasy.new(game)

      computer_logic.cpu_turn

      expect(game.open_spaces.size).to eq(8) 
    end

    it "fills in 2 spots on board in open spaces" do
      game = GameLogic.new
      computer_logic = ComputerLogicEasy.new(game)

      game.board_spaces[0] = :X
      computer_logic.cpu_turn
      computer_logic.cpu_turn

      expect(game.open_spaces.size).to eq(6) 
    end
  end

end