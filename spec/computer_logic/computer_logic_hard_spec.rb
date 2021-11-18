require 'computer_logic/computer_logic_hard'
require "game_logic"


RSpec.describe ComputerLogicHard do

  describe "#cpu_turn" do
    it 'plays the best move' do
      game_logic = double('game_logic')
      cpu_hard = ComputerLogicHard.new(game_logic)

      expect(game_logic).to receive(:best_move).and_return(1)
      expect(game_logic).to receive(:take_turn).with(1)

      cpu_hard.cpu_turn
    end
  end
end