require_relative "../lib/game_loop"

questions = Questions.new
game_config = GameConfig.new(questions)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)

game_loop = GameLoop.new(questions, game_logic, game_config, console_output)

# Runs whole game 
game_loop.run()

#Runs just HvH game
# game_loop.run(:human_vs_human)

#Runs just HvC game
# game_loop.run(:human_vs_computer)


