require_relative "../lib/main_app"

questions = Questions.new
game_config = GameConfig.new(questions)
game_logic = GameLogic.new
console_output = ConsoleOutput.new
game_loop = GameLoop.new(questions, game_logic, game_config, console_output)
game_loop.run()

