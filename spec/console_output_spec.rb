require "console_output"
require "game_logic"

RSpec.describe ConsoleOutput do

  describe "#show_board" do
    it "shows TTT board in terminal" do
      mock_game_config = double("game_config")
      ttt_game = GameLogic.new
      console_output = ConsoleOutput.new(mock_game_config)
      board = ""
      board += "   |   |  \n"
      board += "-----------\n"
      board += "   |   |  \n"
      board += "-----------\n"
      board += "   |   |  "

      expect(console_output.show_board(ttt_game)).to eq(board)
    end
  end

  describe "#formatter" do
    describe "when @game_config.color is false" do
      it "returns a X as a string with no color info for :X" do
        mock_game_config = double("game_config")
        allow(mock_game_config).to receive(:color).and_return(false)

        console_output = ConsoleOutput.new(mock_game_config)

        expect(console_output.formatter(:X)).to eq("X")
      end

      it "returns a O as a string with no color info for :O" do
        mock_game_config = double("game_config")
        allow(mock_game_config).to receive(:color).and_return(false)

        console_output = ConsoleOutput.new(mock_game_config)

        expect(console_output.formatter(:O)).to eq("O")
      end
    end

    describe "when @game_config.color is true" do

    end
  end
end
