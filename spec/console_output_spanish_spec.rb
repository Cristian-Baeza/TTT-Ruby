require "console_output_language/console_output_spanish"
require "game_logic"

RSpec.describe ConsoleOutputSpanish do

  describe "#show_board" do
    it "shows TTT board in terminal" do
      mock_game_config = double("game_config")
      ttt_game = GameLogic.new
      console_output = ConsoleOutputSpanish.new(mock_game_config)
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

        console_output = ConsoleOutputSpanish.new(mock_game_config)

        expect(console_output.formatter(:X)).to eq("X")
      end

      it "returns a O as a string with no color info for :O" do
        mock_game_config = double("game_config")
        allow(mock_game_config).to receive(:color).and_return(false)

        console_output = ConsoleOutputSpanish.new(mock_game_config)

        expect(console_output.formatter(:O)).to eq("O")
      end
    end

    describe "when @game_config.color is true" do
      it "returns a X formatted to be red" do
        mock_game_config = double("game_config")
        allow(mock_game_config).to receive(:color).and_return(true)

        console_output = ConsoleOutputSpanish.new(mock_game_config)

        expect(console_output.formatter(:X)).to eq("\e[31mX\e[0m")
      end
      
      it "returns a O formatted to be blue" do
        mock_game_config = double("game_config")
        allow(mock_game_config).to receive(:color).and_return(true)

        console_output = ConsoleOutputSpanish.new(mock_game_config)

        expect(console_output.formatter(:O)).to eq("\e[34mO\e[0m")
      end
    end
  end
end
