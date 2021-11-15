class GameLoop

  def initialize(questions, players, game_logic, game_config, console_output)
    @questions = questions
    @players = players
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

      @players[@game_logic.current_player].take_turn(@game_logic)

    end
    @console_output.print_game_title_and_board(@game_logic, @game_config)
    if @game_logic.is_there_winner?
      puts("GAME OVER: #{@game_logic.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutputEnglish::TIE_MESSAGE)
    end
  end
end
