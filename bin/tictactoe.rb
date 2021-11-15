require_relative "../lib/game_loop"
require_relative "../lib/env_var_parser"
require_relative "../lib/game_logic"
require_relative "../lib/questions"
require_relative "../lib/console_output_language/console_output_english"
require_relative "../lib/game_config"
require_relative "../lib/computer_logic/computer_logic_easy"
require_relative "../lib/computer_logic/computer_logic_hard"
require_relative "../lib/player_type/player_cpu"
require_relative "../lib/player_type/player_human"

parsed_env_vars = EnvVarParser.new()
questions = Questions.new
game_config = GameConfig.new(questions, parsed_env_vars)
game_logic = GameLogic.new
console_output = ConsoleOutputEnglish.new(game_config)

player_one_type = case game_config.player_one_type
when :human
  PlayerHuman.new(questions)
when :cpu_easy
  PlayerCpu.new(ComputerLogicEasy.new(game_logic))
when :cpu_hard
  PlayerCpu.new(ComputerLogicHard.new(game_logic))
end

player_two_type = case game_config.player_two_type
when :human
  PlayerHuman.new(questions)
when :cpu_easy
  PlayerCpu.new(ComputerLogicEasy.new(game_logic))
when :cpu_hard
  PlayerCpu.new(ComputerLogicHard.new(game_logic))
end


players = { X: player_one_type, O: player_two_type }

game_loop = GameLoop.new(questions, players, game_logic, game_config, console_output)

game_loop.run()


