require_relative "../lib/game_loop"

questions = Questions.new
game_logic = GameLogic.new
game_config = GameConfig.new(questions, game_logic)
console_output = ConsoleOutput.new

game_loop = GameLoop.new(questions, game_logic, game_config, console_output)

game_loop.run()

