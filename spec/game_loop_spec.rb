require 'game_loop'
require_relative '../lib/player_type/player_human.rb'
require_relative '../lib/player_type/player_cpu.rb'

describe GameLoop do
  describe 'run' do
    it 'prints the board and exits the game loop if the game is over' do
      game = GameLogic.new()
      questions = Questions.new
      mock_game_config = double("game_config")
      console_output = ConsoleOutput.new(mock_game_config)
      computer_logic = ComputerLogicEasy.new(game)
      players = { X: PlayerHuman.new(questions), O: PlayerCpu.new(computer_logic) }

      allow(game).to receive(:is_game_over?).and_return(true)
      expect(console_output).to receive(:print_game_title_and_board).once
      game_loop = GameLoop.new(questions, players, game, mock_game_config, console_output)

      game_loop.run()

    end

    it 'plays the last round then exits the game loop if the game is over' do
      game = GameLogic.new()
      mock_game_config = double("game_config")
      console_output = ConsoleOutput.new(mock_game_config)
      mock_questions = double("questions")
      computer_logic = ComputerLogicEasy.new(game)
      players = { X: PlayerHuman.new(mock_questions), O: PlayerCpu.new(computer_logic) }

      allow(mock_questions).to receive(:validate_user_input).and_return(1)
      allow(mock_game_config).to receive(:player_one_type).and_return(:computer)
      allow(mock_game_config).to receive(:player_two_type).and_return(:computer)
      allow(mock_game_config).to receive(:cpu_difficulty).and_return(:easy)
      allow(game).to receive(:is_game_over?).and_return(false, true)
      allow(game).to receive(:current_player).and_return(:O)
      expect(console_output).to receive(:print_game_title_and_board).twice

      game_loop = GameLoop.new(mock_questions, players, game, mock_game_config, console_output)

      game_loop.run()

    end
  end
end
