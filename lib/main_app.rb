require_relative "game_logic"
require_relative "questions"
require_relative "console_output"

class GameLoop

  def run
    @questions = Questions.new
    @game = GameLogic.new
    @console_output = ConsoleOutput.new
    
    game_type = @questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"])

    if game_type == 1
      human_vs_human_game()
    else
      cpu_vs_human_game()
    end

  end


  def cpu_vs_human_game
    until @game.is_game_over? do
      puts(ConsoleOutput::WELCOME_MESSAGE_HVC)
      puts(@console_output.show_board(@game))

      valid_options = @game.open_spaces.map(&:to_s)
      
      user_choice = @questions.validate_user_input("PICK A SPACE PLAYER X", valid_options)
      
      @game.take_turn(user_choice)

      @game.cpu_turn

    end

    puts(@console_output.show_board(@game)) 

    if @game.is_there_winner? 
      puts("GAME OVER: #{@game.is_there_winner?} WINS!!")
    else
      puts(ConsoleOutput::TIE_MESSAGE)
    end

    
  end


  def human_vs_human_game
    until @game.is_game_over? do
      puts(ConsoleOutput::WELCOME_MESSAGE_HVH)
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