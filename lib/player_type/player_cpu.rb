class PlayerCpu
  
  def initialize(computer_logic)
    @computer_logic = computer_logic
  end

  def take_turn(game_logic)
      @computer_logic.cpu_turn()
  end

end