require_relative "game_logic"
require_relative "questions"
require_relative "console_output"

class GameLoop

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new

    player_one_type = :not_set
    player_two_type = :not_set

    if @questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      game_type = :human_vs_human
      player_one_type = :human
      player_two_type = :human
    elsif
      game_type = :human_vs_computer
      player_one_type = :human
      player_two_type = :computer
    end

    until @game.is_game_over? do
      puts(@console_output.welcome_message(player_one_type, player_two_type))
      puts(@console_output.show_board(@game))
      valid_options = @game.open_spaces.map(&:to_s)

      if @game.current_player == :X || (@game.current_player == :O && player_two_type == :human)
        user_choice = @questions.validate_user_input("PICK A SPACE #{@game.current_player()}", valid_options)
        @game.take_turn(user_choice)
      else
        @game.cpu_turn
      end
    end

    puts(@console_output.welcome_message(player_one_type, player_two_type))
    puts(@console_output.show_board(@game))

    if @game.is_there_winner?
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end

  end




end
