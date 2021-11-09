class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color, :cpu_difficulty_player_one, :cpu_difficulty_player_two
  def initialize (questions, parsed_arguments = nil)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @cpu_difficulty_player_one = :not_set
    @cpu_difficulty_player_two = :not_set
    @questions = questions

    if parsed_arguments.color == nil
      configure_color_board()
    else
      @color = parsed_arguments.color 
    end

    if parsed_arguments.game_type == nil
      configure_game_type()
    else
      @player_one_type = set_player_type(parsed_arguments, :player_one)
      @player_two_type = set_player_type(parsed_arguments, :player_two)
    end
  end

  def set_player_type(parsed_arguments, player)
    if player == :player_one
      :human
    elsif player == :player_two
      if parsed_arguments.game_type == "hvh"
        :human
      elsif parsed_arguments.game_type == "hvc"
        :computer
      end
    end
  end

  def configure_game_type
    if @questions.validate_user_input("PLAYER 1 IS A: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_one_type = :human
    else
      @player_one_type = :computer
      @cpu_difficulty_player_one = configure_cpu_difficulty()
    end
    
    if @questions.validate_user_input("PLAYER 2 IS A: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_two_type = :human
    else
      @player_two_type = :computer
      @cpu_difficulty_player_two = configure_cpu_difficulty()
    end
  end

  def configure_color_board
    if @questions.validate_user_input("COLOR?: \n1.YES\n2.NO", ["1","2"]) == 1
      @color = true
    end
  end

  def configure_cpu_difficulty
    @questions.validate_user_input("CPU DIFFICULTY?: \n1.EASY\n2.HARD", ["1","2"]) == 1 ? :easy : :hard
  end




end
