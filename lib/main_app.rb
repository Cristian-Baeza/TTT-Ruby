require_relative "game_logic"
require_relative "questions"
require_relative "console_output"

class GameLoop

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new

    until @game.is_game_over? do
      puts(ConsoleOutput::WELCOME_MESSAGE)
      puts(@console_output.show_board(@game))

      valid_options = @game.open_spaces.map(&:to_s)  

      user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
      @game.take_turn(user_choice)
    end

    puts(@console_output.show_board(@game)) 

    if @game.is_there_winner? 
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end

  end
end