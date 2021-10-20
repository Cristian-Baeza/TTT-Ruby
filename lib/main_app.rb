require_relative "game_logic"
require_relative "questions"
require_relative "console_output"
require_relative "game_config"



class GameLoop

  def print_game_title_and_board
    puts(@console_output.welcome_message(@game_config))
    puts(@console_output.show_board(@game))
  end

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new

    @game_config = GameConfig.new(@questions)

    until @game.is_game_over? do
      print_game_title_and_board
      valid_options = @game.open_spaces.map(&:to_s)

      if @game.current_player == :X || (@game.current_player == :O && @game_config.player_two_type == :human)
        user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
        @game.take_turn(user_choice)
      else
        @game.cpu_turn
      end
    end
    print_game_title_and_board

    if @game.is_there_winner?
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end

  end


end
