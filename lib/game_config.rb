class GameConfig
  attr_accessor :player_one_type, :player_two_type, :color
  def initialize (questions, parsed_arguments = nil)
    @player_one_type = :not_set
    @player_two_type = :not_set
    @color = false
    @questions = questions

    if questions.validate_user_input("COLOR?: \n1.YES\n2.NO", ["1","2"]) == 1
      @color = true
    end

    if parsed_arguments.game_type[0] == nil
      self.configure_game_type()
    else
      puts "WHYYYY"
      @player_one_type = set_player_type(parsed_arguments, :player_one)
      @player_two_type = set_player_type(parsed_arguments, :player_two)
    end
  end


  def set_player_type(parsed_arguments, player)
    if player == :player_one
      puts "p1 is human"
      :human
    else
      if parsed_arguments.game_type[0] == "hvh"
        puts "p2 is human"
        :human
      else
        puts "p2 is cpu"
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




end
