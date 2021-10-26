class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color, :game_type
  def initialize (questions)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @game_type = :not_set
    @questions = questions

    if questions.validate_user_input("COLOR?: \n1.YES\n2.NO", ["1","2"]) == 1
      @color = true
    end

  def configure_game_type
    if @questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_one_type = :human
      @player_two_type = :human
      @game_type = :human_vs_human
    else
      @player_one_type = :human
      @player_two_type = :computer
      @game_type = :human_vs_computer
    end
  end

    
  end
end
