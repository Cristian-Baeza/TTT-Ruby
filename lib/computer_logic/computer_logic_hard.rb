class ComputerLogicHard
  
    def initialize(game_logic)
      @game_logic = game_logic
    end

    def cpu_turn
      best_move = @game_logic.best_move
      @game_logic.take_turn(best_move)
    end


end