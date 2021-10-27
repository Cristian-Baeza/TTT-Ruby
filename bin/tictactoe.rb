require_relative "../lib/game_loop"
require_relative "../lib/argument_parser"

parsed_arguments = ArgumentParser.new(ARGV)
questions = Questions.new
game_config = GameConfig.new(questions, parsed_arguments)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)

game_loop = GameLoop.new(questions, game_logic, game_config, console_output)


game_loop.run()
# for i in 0..ARGV.length
#   puts "#{i} (#{ARGV[i]})" 
# end

