class GameConfig
  attr_reader :player_one_type, :player_two_type

  def initialize (questions)
    @player_one_type = :not_set
    @player_two_type = :not_set

    if questions.validate_user_input("PLAY VS: \n1.HUMAN \n2.CPU", ["1","2"]) == 1
      @player_one_type = :human
      @player_two_type = :human
    elsif
      @player_one_type = :human
      @player_two_type = :computer
    end
  end
end
