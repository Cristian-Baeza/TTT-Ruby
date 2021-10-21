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
    cpu_turn = best_spot()
    take_turn(cpu_turn)
  end



  def best_spot
    result = minimax(@board_spaces, :O) 
    cpu_choice = result[:score]
    return cpu_choice
  end


  def minimax(new_board, player)
    avail_spots = open_spaces()
    if is_there_winner?() == :X  
      return {:score => -10}
    elsif is_there_winner?() == :O 
      return {:score => 10}
    elsif open_spaces().size == 0 
      return {:score => 0}
    end

    moves = []
    for i in avail_spots
      move = {}
      move[:index] = new_board[avail_spots[i]]
      new_board[avail_spots[i]] = player

      if player == :O
        result = minimax(new_board, :X)
        move.score = result.score
      else
        result = minimax(new_board, :O)
        move.score = result.score
      end

      new_board[avail_spots[i]] = move[:index]

      moves.append(move)
    end

    best_move = 0
    if player == :O
      best_score = -10000
      for i in moves
        if moves[i].score > best_score
          best_score = moves[i].score
          best_move = i
        end
      end
    else
      best_score = 10000
      for i in moves
        if moves[i].score < best_score
          best_score = moves[i].score
          best_move = i
        end
      end
    end

    return moves[best_move]


  end


 




end

