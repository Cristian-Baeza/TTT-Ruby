require_relative "../lib/game_loop"

questions = Questions.new
game_config = GameConfig.new(questions)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)

game_loop = GameLoop.new(questions, game_logic, game_config, console_output)

game_loop.run()

