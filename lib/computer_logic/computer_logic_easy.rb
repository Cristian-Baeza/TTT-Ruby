class ComputerLogicEasy
  
  def initialize(game_logic)
    @game_logic = game_logic
  end

  def cpu_turn
    cpu_take_open_space()
  end

  def cpu_take_open_space
    random_open_space = @game_logic.open_spaces().sample
    @game_logic.take_turn(random_open_space) 
  end


end