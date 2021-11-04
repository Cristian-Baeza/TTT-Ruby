class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color, :cpu_difficulty
  def initialize (questions, parsed_arguments = nil)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @cpu_difficulty = :hard
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

    if @player_two_type == :computer
      configure_cpu_difficulty()
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
    if @questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_one_type = :human
      @player_two_type = :human
    else
      @player_one_type = :human
      @player_two_type = :computer
    end
  end

  def configure_color_board
    if @questions.validate_user_input("COLOR?: \n1.YES\n2.NO", ["1","2"]) == 1
      @color = true
    end
  end

  def configure_cpu_difficulty
    if @questions.validate_user_input("CPU DIFFICULTY?: \n1.EASY\n2.HARD", ["1","2"]) == 1
      @cpu_difficulty = :easy
    end
  end




end
