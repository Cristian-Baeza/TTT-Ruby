class GameLogic
  attr_reader :board_spaces

  WIN_COMBOS = [
    [0,1,2], # top_row
    [3,4,5], # middle_row
    [6,7,8], # bottom_row
    [0,3,6], # left_column
    [1,4,7], # center_column
    [2,5,8], # right_column
    [0,4,8], # left_diagonal
    [6,4,2] # right_diagonal
  ]

  def initialize()
    @board_spaces = Array.new(9, :empty)
  end

  def take_turn(choice)
    @board_spaces[choice -1] = current_player()
  end

  def open_spaces
    spaces_available_index = @board_spaces.each_index.select {|i| @board_spaces[i] == :empty}
    spaces_available_index.map {|each| each + 1}
  end

  def is_there_winner?
    winner_symbol = nil
    for win_combo in WIN_COMBOS do
      row = Array.new
      for index in win_combo do
        row.append(@board_spaces[index])
      end
      if (row.all? { |each| each == row[0]})
          if row[0] != :empty
            winner_symbol = row[0]
          end
      end
    end
    winner_symbol
  end

  def turn_count
    @board_spaces.size - @board_spaces.count(:empty)
  end

  def current_player
      turn_count() % 2 == 0 ? :X : :O
  end

  def board_full?
    !@board_spaces.include?(:empty)
  end

  def is_game_over?
    board_full?() || is_there_winner?()
  end

  def cpu_turn
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

  def cpu_take_open_space
    random_open_space = open_spaces().sample
    take_turn(random_open_space) 
  end

  def cpu_check_for_wins_or_blocks_horizontally?(player_symbol)
    if @board_spaces[0] == player_symbol && @board_spaces[1] == player_symbol && @board_spaces[2] == :empty
      @board_spaces[2] = :O
      true
    elsif @board_spaces[1] == player_symbol && @board_spaces[2] == player_symbol && @board_spaces[0] == :empty
      @board_spaces[0] = :O
      true
    elsif @board_spaces[3] == player_symbol && @board_spaces[4] == player_symbol && @board_spaces[5] == :empty
      @board_spaces[5] = :O
      true
    elsif @board_spaces[4] == player_symbol && @board_spaces[5] == player_symbol && @board_spaces[3] == :empty
      @board_spaces[3] = :O
      true
    elsif @board_spaces[6] == player_symbol && @board_spaces[7] == player_symbol && @board_spaces[8] == :empty
      @board_spaces[8] = :O
      true
    elsif @board_spaces[7] == player_symbol && @board_spaces[8] == player_symbol && @board_spaces[6] == :empty
      @board_spaces[6] = :O
      true
    else
      false
    end
  end
  
  def cpu_check_for_wins_or_blocks_vertically?(player_symbol)
    if @board_spaces[0] == player_symbol && @board_spaces[3] == player_symbol && @board_spaces[6] == :empty
      @board_spaces[6] = :O
      true
    elsif @board_spaces[3] == player_symbol && @board_spaces[6] == player_symbol && @board_spaces[0] == :empty
      @board_spaces[0] = :O
      true
    elsif @board_spaces[1] == player_symbol && @board_spaces[4] == player_symbol && @board_spaces[7] == :empty
      @board_spaces[7] = :O
      true
    elsif @board_spaces[4] == player_symbol && @board_spaces[7] == player_symbol && @board_spaces[1] == :empty
      @board_spaces[1] = :O
      true
    elsif @board_spaces[2] == player_symbol && @board_spaces[5] == player_symbol && @board_spaces[8] == :empty
      @board_spaces[8] = :O
      true
    elsif @board_spaces[5] == player_symbol && @board_spaces[8] == player_symbol && @board_spaces[2] == :empty
      @board_spaces[2] = :O
      true
    else
      false
    end
  end


  def cpu_check_for_wins_or_blocks_diagonally?(player_symbol)
    if @board_spaces[0] == player_symbol && @board_spaces[4] == player_symbol && @board_spaces[8] == :empty
      @board_spaces[8] = :O
      true
    elsif @board_spaces[4] == player_symbol && @board_spaces[8] == player_symbol && @board_spaces[0] == :empty
      @board_spaces[0] = :O
      true
    elsif @board_spaces[2] == player_symbol && @board_spaces[4] == player_symbol && @board_spaces[6] == :empty
      @board_spaces[6] = :O
      true
    elsif @board_spaces[6] == player_symbol && @board_spaces[4] == player_symbol && @board_spaces[2] == :empty
      @board_spaces[2] = :O
      true
    else
      false
    end
  end


end

