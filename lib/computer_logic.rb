class ComputerLogic
  
    def initialize(game_logic)
      @game_logic = game_logic
    end
  
    def cpu_turn_hard
      if cpu_check_for_wins_or_blocks_horizontally?(:X)
      elsif cpu_check_for_wins_or_blocks_vertically?(:X)
      elsif cpu_check_for_wins_or_blocks_diagonally?(:X)
  
      elsif cpu_check_for_wins_or_blocks_horizontally?(:O)
      elsif cpu_check_for_wins_or_blocks_vertically?(:O)
      elsif cpu_check_for_wins_or_blocks_diagonally?(:O)
      else
         cpu_take_open_space()
      end
    end

    def cpu_turn_easy
      cpu_take_open_space()
    end

    def cpu_take_open_space
      random_open_space = @game_logic.open_spaces().sample
      @game_logic.take_turn(random_open_space) 
    end
  
  def cpu_check_for_wins_or_blocks_horizontally?(player_symbol)
    if @game_logic.board_spaces[0] == player_symbol && @game_logic.board_spaces[1] == player_symbol && @game_logic.board_spaces[2] == :empty
      @game_logic.board_spaces[2] = :O
      true
    elsif @game_logic.board_spaces[1] == player_symbol && @game_logic.board_spaces[2] == player_symbol && @game_logic.board_spaces[0] == :empty
      @game_logic.board_spaces[0] = :O
      true
    elsif @game_logic.board_spaces[3] == player_symbol && @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[5] == :empty
      @game_logic.board_spaces[5] = :O
      true
    elsif @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[5] == player_symbol && @game_logic.board_spaces[3] == :empty
      @game_logic.board_spaces[3] = :O
      true
    elsif @game_logic.board_spaces[6] == player_symbol && @game_logic.board_spaces[7] == player_symbol && @game_logic.board_spaces[8] == :empty
      @game_logic.board_spaces[8] = :O
      true
    elsif @game_logic.board_spaces[7] == player_symbol && @game_logic.board_spaces[8] == player_symbol && @game_logic.board_spaces[6] == :empty
      @game_logic.board_spaces[6] = :O
      true
    else
      false
    end
  end
  
  def cpu_check_for_wins_or_blocks_vertically?(player_symbol)
    if @game_logic.board_spaces[0] == player_symbol && @game_logic.board_spaces[3] == player_symbol && @game_logic.board_spaces[6] == :empty
      @game_logic.board_spaces[6] = :O
      true
    elsif @game_logic.board_spaces[3] == player_symbol && @game_logic.board_spaces[6] == player_symbol && @game_logic.board_spaces[0] == :empty
      @game_logic.board_spaces[0] = :O
      true
    elsif @game_logic.board_spaces[1] == player_symbol && @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[7] == :empty
      @game_logic.board_spaces[7] = :O
      true
    elsif @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[7] == player_symbol && @game_logic.board_spaces[1] == :empty
      @game_logic.board_spaces[1] = :O
      true
    elsif @game_logic.board_spaces[2] == player_symbol && @game_logic.board_spaces[5] == player_symbol && @game_logic.board_spaces[8] == :empty
      @game_logic.board_spaces[8] = :O
      true
    elsif @game_logic.board_spaces[5] == player_symbol && @game_logic.board_spaces[8] == player_symbol && @game_logic.board_spaces[2] == :empty
      @game_logic.board_spaces[2] = :O
      true
    else
      false
    end
  end


  def cpu_check_for_wins_or_blocks_diagonally?(player_symbol)
    if @game_logic.board_spaces[0] == player_symbol && @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[8] == :empty
      @game_logic.board_spaces[8] = :O
      true
    elsif @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[8] == player_symbol && @game_logic.board_spaces[0] == :empty
      @game_logic.board_spaces[0] = :O
      true
    elsif @game_logic.board_spaces[2] == player_symbol && @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[6] == :empty
      @game_logic.board_spaces[6] = :O
      true
    elsif @game_logic.board_spaces[6] == player_symbol && @game_logic.board_spaces[4] == player_symbol && @game_logic.board_spaces[2] == :empty
      @game_logic.board_spaces[2] = :O
      true
    else
      false
    end
  end

end