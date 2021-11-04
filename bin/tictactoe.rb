require_relative "../lib/game_loop"
require_relative "../lib/argument_parser"

parsed_arguments = ArgumentParser.new(ARGV)
questions = Questions.new
game_config = GameConfig.new(questions, parsed_arguments)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)
computer_logic = ComputerLogic.new(game_logic, game_config)

game_loop = GameLoop.new(questions, game_logic, game_config, console_output, computer_logic)

game_loop.run()


