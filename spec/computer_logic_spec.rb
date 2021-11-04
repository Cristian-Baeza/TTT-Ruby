require 'computer_logic'
require "game_logic"
require "game_config"
require "questions"
require "argument_parser"

RSpec.describe ComputerLogic do

  describe "#cpu_turn" do
    it "fills in one spot on board" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new([])
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      computer_logic.cpu_take_open_space

      expect(game.open_spaces.size).to eq(8) 
    end

    it "fills in 2 spots on board in open spaces" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[0] = :X
      computer_logic.cpu_take_open_space
      computer_logic.cpu_take_open_space

      expect(game.open_spaces.size).to eq(6) 
    end
  end

  describe "#cpu_check_for_wins_or_blocks_horizontally" do
    it "fills a :O in rightmost spot if there is two X's together horizontally" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[0] = :X
      game.board_spaces[1] = :X

      computer_logic.cpu_check_for_wins_or_blocks_horizontally?(:X)

      expect(game.board_spaces[2]).to eq(:O)
    end
    
    it "fills a :O in leftmost spot if there is two X's together horiztonally " do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[1] = :X
      game.board_spaces[2] = :X

      computer_logic.cpu_check_for_wins_or_blocks_horizontally?(:X)

      expect(game.board_spaces[0]).to eq(:O)
    end
  end
  
  describe "#cpu_check_for_wins_or_blocks_vertically" do
    it "fills a :O in bottom spot if there is two X's together vertically" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)
      
      game.board_spaces[0] = :X
      game.board_spaces[3] = :X

      computer_logic.cpu_check_for_wins_or_blocks_vertically?(:X)

      expect(game.board_spaces[6]).to eq(:O)
    end
    
    it "fills a :O in uppermost spot if there is two X's together vertically " do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[4] = :X
      game.board_spaces[7] = :X

      computer_logic.cpu_check_for_wins_or_blocks_vertically?(:X)

      expect(game.board_spaces[1]).to eq(:O)
    end
  end
  
  describe "#cpu_check_for_wins_or_blocks_diagonally" do
    it "fills a :O in bottom right spot if there is two X's together diagonally" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[0] = :X
      game.board_spaces[4] = :X

      computer_logic.cpu_check_for_wins_or_blocks_diagonally?(:X)

      expect(game.board_spaces[8]).to eq(:O)
    end
    
    it "fills a :O in bottom left spot if there is two X's together diagonally " do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[2] = :X
      game.board_spaces[4] = :X

      computer_logic.cpu_check_for_wins_or_blocks_diagonally?(:X)

      expect(game.board_spaces[6]).to eq(:O)
    end
  end
  
  describe "#cpu_check_for_wins_or_blocks_horizontally" do
    it "fills a :O in empty spot if it has two in a row horizontally" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[0] = :O
      game.board_spaces[1] = :O

      computer_logic.cpu_check_for_wins_or_blocks_horizontally?(:O)

      expect(game.board_spaces[2]).to eq(:O)
    end
  end
  
  describe "#cpu_check_for_wins_or_blocks_vertically" do
    it "fills a :O in empty spot if it has two in a row vertically" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[0] = :O
      game.board_spaces[3] = :O

      computer_logic.cpu_check_for_wins_or_blocks_vertically?(:O)

      expect(game.board_spaces[6]).to eq(:O)
    end
  end
  
  describe "#cpu_check_for_wins_or_blocks_diagonally" do
    it "fills a :O in empty spot if it has two in a row diagonally" do
      game = GameLogic.new
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(ARGV)
      mock_game_config = double("game_config")
      allow(mock_game_config).to receive(:color).and_return(true)
      computer_logic = ComputerLogic.new(game, mock_game_config)

      game.board_spaces[2] = :O
      game.board_spaces[4] = :O

      computer_logic.cpu_check_for_wins_or_blocks_diagonally?(:O)

      expect(game.board_spaces[6]).to eq(:O)
    end
  end

end