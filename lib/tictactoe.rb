class Tic_Tac_Toe
  
  def initialize
    @board_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end


  def run_app()
    puts(welcome_message())
    puts(show_empty_board(@board_spaces))


  end


  def welcome_message
    "WELCOME TO TIC-TAC-TOE\n" + "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"
  end


  def show_empty_board(board_spaces)
    board = ""
    board += " #{board_spaces[0]} | #{board_spaces[1]} |  #{board_spaces[2]}\n"
    board += "-----------\n"
    board += " #{board_spaces[3]} | #{board_spaces[4]} |  #{board_spaces[5]}\n"
    board += "-----------\n"
    board += " #{board_spaces[6]} | #{board_spaces[7]} |  #{board_spaces[8]}"
   
    return board
  end


  def validate_user_input(user_input)
    if (user_input == "X" or user_input == "O")
      "GREAT CHOICE!"
    else
      "INVALID INPUT: PLEASE CHOOSE X OR O"
    end
  end




end

