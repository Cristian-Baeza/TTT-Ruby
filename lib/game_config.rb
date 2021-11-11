class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color, :cpu_difficulty_player_one, :cpu_difficulty_player_two
  def initialize (questions, parsed_arguments = nil)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @cpu_difficulty_player_one = :not_set
    @cpu_difficulty_player_two = :not_set
    @questions = questions
    @parsed_arguments = parsed_arguments

    configure_color_board()
    configure_all_players()
  end


  def configure_color_board
    if @parsed_arguments.color == nil
      set_color_board()
    else
      @color = @parsed_arguments.color 
    end
  end


  def configure_all_players()
    #player 1
    if @parsed_arguments.player_one_type == nil
      configure_player_type(:player_one)
    else
      @player_one_type = @parsed_arguments.player_one_type
      @cpu_difficulty_player_one = @parsed_arguments.cpu_difficulty_player_one
    end
    #player 2
    if @parsed_arguments.player_two_type == nil
      configure_player_type(:player_two)
    else
      @player_two_type = @parsed_arguments.player_two_type
      @cpu_difficulty_player_two = @parsed_arguments.cpu_difficulty_player_two
    end
  end


  def configure_player_type(player)
    if player == :player_one
      @player_one_type = @questions.multichoice("PLAYER 1 IS A:", [:human, :computer])
      if @player_one_type == :computer
        @cpu_difficulty_player_one = configure_cpu_difficulty()
      end
    elsif player == :player_two
      @player_two_type = @questions.multichoice("PLAYER 2 IS A:", [:human, :computer])
      if @player_two_type == :computer
        @cpu_difficulty_player_two = configure_cpu_difficulty()
      end
    end
  end

  def set_color_board
      @color = @questions.yes_or_no?("COLOR?:")
  end

  def configure_cpu_difficulty
    @questions.multichoice("CPU DIFFICULTY?:", [:easy, :hard])
  end




end
