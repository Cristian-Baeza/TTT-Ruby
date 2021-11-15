class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color

  def initialize (questions, parsed_arguments = nil)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @questions = questions
    @parsed_arguments = parsed_arguments

    @color = configure_color_board()
    @player_one_type = configure_player(@parsed_arguments.player_one_type)
    @player_two_type = configure_player(@parsed_arguments.player_two_type)
  end


  def configure_color_board
    if @parsed_arguments.color == nil
      @questions.yes_or_no?("COLOR?:")
    else
      @parsed_arguments.color
    end
  end


  def configure_player(parsed_player_type)
    if parsed_player_type == nil
      set_player_type()
    else
      parsed_player_type
    end
  end


  def set_player_type()
    if @questions.multichoice("PLAYER 1 IS A:", [:human, :computer]) == :computer
      if set_cpu_difficulty() == :easy
        :cpu_easy
      else
        :cpu_hard
      end
    else
      :human
    end
  end


  def set_cpu_difficulty
    @questions.multichoice("CPU DIFFICULTY?:", [:easy, :hard])
  end




end
