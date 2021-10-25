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
    @color_p1 = "\e[31mX\e[0m"
    @color_p2 = "\e[34mO\e[0m"
  end

  def run()

    if @questions.validate_user_input("COLORED BOARD?: \n1.YES \n2.NO", ["1","2"]) == 1
      @game_logic.player_one = @color_p1
      @game_logic.player_two = @color_p2
    end

    until @game_logic.is_game_over? do
      @console_output.print_game_title_and_board(@game_logic, @game_config)
      valid_options = @game_logic.open_spaces.map(&:to_s)

      # H vs H
      if @game_logic.current_player == @game_logic.player_one || (@game_logic.current_player == @game_logic.player_two && @game_config.player_two_type == :human)
        user_choice = @questions.validate_user_input("PICK A SPACE PLAYER #{@game_logic.current_player()}", valid_options)
        @game_logic.take_turn(user_choice)
      else
        #H v C
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
