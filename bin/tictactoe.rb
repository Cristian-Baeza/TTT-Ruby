require_relative "../lib/game_loop"
require_relative "../lib/argument_parser"
require_relative "../lib/game_logic"
require_relative "../lib/questions"
require_relative "../lib/console_output"
require_relative "../lib/game_config"
require_relative "../lib/computer_logic/computer_logic_easy"
require_relative "../lib/computer_logic/computer_logic_hard"

parsed_arguments = ArgumentParser.new(ARGV)
questions = Questions.new
game_config = GameConfig.new(questions, parsed_arguments)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)
computer_logic = game_config.cpu_difficulty == :easy ? ComputerLogicEasy.new(game_logic) : ComputerLogicHard.new(game_logic)

game_loop = GameLoop.new(questions, game_logic, game_config, console_output, computer_logic)

game_loop.run()


