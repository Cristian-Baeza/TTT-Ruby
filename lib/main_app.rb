require_relative "game_logic"
require_relative "questions"
require_relative "console_output"

class GameLoop

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new

    until @game.board_full? || @game.is_there_winner? do
      puts(@console_output.welcome_message())
      puts(@console_output.show_board(@game))

      valid_options = @game.open_spaces.map(&:to_s)  

      user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
      @game.take_turn(user_choice)
    end

    if @game.is_there_winner?
      puts(@console_output.show_board(@game)) 
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(@console_output.show_board(@game))
      puts(@console_output.tie_message)
    end

  end
end