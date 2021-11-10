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
    @player_one_type = @questions.multichoice("PLAYER 1 IS A:", [:human, :computer])
    if @player_one_type == :computer
      @cpu_difficulty_player_one = configure_cpu_difficulty()
    end

    @player_two_type = @questions.multichoice("PLAYER 2 IS A:", [:human, :computer])
    if @player_two_type == :computer
      @cpu_difficulty_player_two = configure_cpu_difficulty()
    end
  end

  def configure_color_board
      @color = @questions.yes_or_no?("COLOR?:")
  end

  def configure_cpu_difficulty
    @questions.multichoice("CPU DIFFICULTY?:", [:easy, :hard])
  end




end
