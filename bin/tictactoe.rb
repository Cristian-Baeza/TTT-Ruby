require_relative "../lib/game_loop"
require_relative "../lib/env_var_parser"
require_relative "../lib/game_logic"
require_relative "../lib/questions"
require_relative "../lib/console_output"
require_relative "../lib/game_config"
require_relative "../lib/computer_logic/computer_logic_easy"
require_relative "../lib/computer_logic/computer_logic_hard"
require_relative "../lib/player_type/player_cpu"
require_relative "../lib/player_type/player_human"

parsed_env_vars = EnvVarParser.new()
questions = Questions.new
game_config = GameConfig.new(questions, parsed_env_vars)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)

computer_logic_player_one = game_config.cpu_difficulty_player_one == :easy ? ComputerLogicEasy.new(game_logic) : ComputerLogicHard.new(game_logic)
computer_logic_player_two = game_config.cpu_difficulty_player_two == :easy ? ComputerLogicEasy.new(game_logic) : ComputerLogicHard.new(game_logic)

player_one_type = game_config.player_one_type == :computer ? PlayerCpu.new(computer_logic_player_one) : PlayerHuman.new(questions)
player_two_type = game_config.player_two_type == :computer ? PlayerCpu.new(computer_logic_player_two) : PlayerHuman.new(questions)

players = { X: player_one_type, O: player_two_type }

game_loop = GameLoop.new(questions, players, game_logic, game_config, console_output)

game_loop.run()


