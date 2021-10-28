require_relative "game_logic"
require_relative "questions"
require_relative "console_output"
require_relative "game_config"

class GameLoop

  def initialize(questions, game_logic, game_config, console_output)
    @questions = questions
    @game_logic = game_logic
    @game_config = game_config
    @console_output = console_output
  end

  def run
      core_game()
  end

  def core_game
    until @game_logic.is_game_over? do
      @console_output.print_game_title_and_board(@game_logic, @game_config)
      valid_options = @game_logic.open_spaces.map(&:to_s)

      if @game_logic.current_player == :X || (@game_logic.current_player == :O && @game_config.player_two_type == :human)
        user_choice = @questions.validate_user_input("PICK A SPACE #{@game_logic.current_player()}", valid_options)
        @game_logic.take_turn(user_choice)
      else
        @game_logic.cpu_turn
      end
    end
    @console_output.print_game_title_and_board(@game_logic, @game_config)
    if @game_logic.is_there_winner?
      puts("GAME OVER: #{@game_logic.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end
  end
end
