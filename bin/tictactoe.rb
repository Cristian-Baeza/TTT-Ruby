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
computer_logic = game_config.cpu_difficulty == :easy ? ComputerLogicEasy.new(game_logic) : ComputerLogicHard.new(game_logic)

player_two_type = game_config.player_two_type == :computer ? PlayerCpu.new(computer_logic) : PlayerHuman.new(questions)
players = { X: PlayerHuman.new(questions), O: player_two_type }

game_loop = GameLoop.new(questions, players, game_logic, game_config, console_output)

game_loop.run()


