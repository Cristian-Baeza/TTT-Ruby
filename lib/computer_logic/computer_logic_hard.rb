class ComputerLogicHard
  
    def initialize(game_logic)
      @game_logic = game_logic
    end

    def cpu_turn
      if cpu_check_for_wins_or_blocks(:O)
      elsif cpu_check_for_wins_or_blocks(:X)
      else
         cpu_take_open_space()
      end
    end

    def cpu_take_open_space
      random_open_space = @game_logic.open_spaces().sample
      @game_logic.take_turn(random_open_space) 
    end

def cpu_check_for_wins_or_blocks(player_symbol)
  move = false
  for win_combo in @game_logic.win_combos do
    row = Array.new
    for index in win_combo do
      row.append(@game_logic.board_spaces[index])
    end
    if (row.count(player_symbol) == 2) && (row.include?(:empty))
      move = win_combo[row.index(:empty)]
      @game_logic.board_spaces[move] = :O
      move = true
    end
  end
  move
end


end