class GameLogic
  attr_accessor :board_spaces, :player_one, :player_two

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
    @player_one = :X
    @player_two = :O
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
      turn_count() % 2 == 0 ? @player_one : @player_two
  end

  def board_full?
    !@board_spaces.include?(:empty)
  end

  def is_game_over?
    board_full?() || is_there_winner?()
  end

  def cpu_turn
    random_open_space = open_spaces().sample
    take_turn(random_open_space)
  end



end

