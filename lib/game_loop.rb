require_relative "game_logic"
require_relative "questions"
require_relative "console_output"
require_relative "game_config"

class GameLoop

  def initialize(questions, game, game_config, console_output)
    @questions = questions
    @game = game
    @game_config = game_config
    @console_output = console_output
  end

  def run()
    until @game.is_game_over? do
      @console_output.print_game_title_and_board(@game, @game_config)
      valid_options = @game.open_spaces.map(&:to_s)

      if @game.current_player == :X || (@game.current_player == :O && @game_config.player_two_type == :human)
        user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
        @game.take_turn(user_choice)
      else
        @game.cpu_turn
      end
    end
    @console_output.print_game_title_and_board(@game, @game_config)

    if @game.is_there_winner?
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end

  end
end
