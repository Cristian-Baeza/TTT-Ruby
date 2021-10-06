class Tic_Tac_Toe
    attr_reader :board_spaces, :player1, :player2
    
    WELCOME_MESSAGE = "-----------------------------\n WELCOME TO TIC-TAC-TOE\n" + "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"
    
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
    @board_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = "X"
    @player2 = "O"
    @player_counter = 2
  end


  def welcome_message
    WELCOME_MESSAGE
  end


  def take_turn(board_spaces, choice)
    if @player_counter.even?
      board_spaces[choice - 1] = @player1
      @player_counter += 1
    elsif @player_counter.odd?
      board_spaces[choice - 1] = @player2
      @player_counter += 1
    end
  end


  def show_board(board_spaces)
    board = ""
    board += " #{board_spaces[0]} | #{board_spaces[1]} |  #{board_spaces[2]}\n"
    board += "-----------\n"
    board += " #{board_spaces[3]} | #{board_spaces[4]} |  #{board_spaces[5]}\n"
    board += "-----------\n"
    board += " #{board_spaces[6]} | #{board_spaces[7]} |  #{board_spaces[8]}"
    return board
  end


  def check_for_winner?(board)
    winner_symbol = ""
    for win_combo in WIN_COMBOS do
      row = Array.new
      for index in win_combo do 
        row.append(board[index])
      end
      if (row.all? { |each| each == row[0]})
          if row[0] != " "
            winner_symbol = row[0]
          end
      end

    end
    winner_symbol != "" ? winner_symbol : nil
  end


  def turn_count(board)
    board.size - board.count(" ")
  end
 

 def current_player(board)
    turn_count(board) % 2 == 0 ? "PLAYER X" : "PLAYER O"
 end



end

