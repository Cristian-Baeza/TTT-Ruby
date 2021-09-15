require "tictactoe"

RSpec.describe Tic_Tac_Toe do
  describe 'run_app' do
    it 'returns the sum of its arguments' do
      expect(Tic_Tac_Toe.new.run_app()).to eq("Welcome to Tic-Tac-Toe")
    end
  end
end