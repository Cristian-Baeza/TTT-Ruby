require_relative "game_logic"
require_relative "questions"
require_relative "console_output"

# Did not work
# @questions = Questions.new
# @game = GameLogic.new
# @console_output = ConsoleOutput.new

class GameLoop

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new

    until @game.check_for_winner? do  # rename this to @game.in_progress
      puts(@console_output.welcome_message())
      puts(@console_output.show_board(@game))

      available_spaces = @game.open_spaces 

      valid_options = available_spaces.map(&:to_s) 
    
      user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
      
      @game.take_turn(user_choice) 

    end
    puts(@console_output.show_board(@game)) 
    puts("GAME OVER: #{@game.check_for_winner?} WINS!!")
  end

end

game = GameLoop.new
game.run()