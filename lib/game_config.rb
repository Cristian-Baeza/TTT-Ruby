class GameConfig
  attr_reader :player_one_type, :player_two_type
  def initialize (questions, game_logic)
    @questions = questions
    @game_logic = game_logic
    @player_one_type = :not_set
    @player_two_type = :not_set

    if questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_one_type = :human
      @player_two_type = :human
    else
      @player_one_type = :human
      @player_two_type = :computer
    end
  end

  def set_player_colors
    if @questions.validate_user_input("COLORED BOARD?: \n1.YES \n2.NO", ["1","2"]) == 1
      @game_logic.player_one = colorize_player1(@game_logic.player_one)
      @game_logic.player_two = colorize_player2(@game_logic.player_two)
    end
  end

  def colorize_player1(player)
    "\e[31m#{player}\e[0m"
  end
  
  def colorize_player2(player)
    "\e[34m#{player}\e[0m"
  end

end
