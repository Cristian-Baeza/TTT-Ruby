class ConsoleOutput

    WELCOME_MESSAGE = "-----------------------------\nWELCOME TO TIC-TAC-TOE\n" + "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"
    SPACE_TAKEN = "-----------------------------\n SPACE TAKEN! PICK ANOTHER"
    TIE_MESSAGE = "GAME OVER: TIE!"

    def welcome_message
      WELCOME_MESSAGE
    end
  
    def space_taken_message
      SPACE_TAKEN
    end

    def tie_message
      TIE_MESSAGE
    end

    def formatter(value)
      return " " if value == :empty
      value
    end

  def show_board(ttt)
    board = ""
    board += " #{formatter(ttt.board_spaces[0])} | #{formatter(ttt.board_spaces[1])} | #{formatter(ttt.board_spaces[2])}\n"
    board += "-----------\n"
    board += " #{formatter(ttt.board_spaces[3])} | #{formatter(ttt.board_spaces[4])} | #{formatter(ttt.board_spaces[5])}\n"
    board += "-----------\n"
    board += " #{formatter(ttt.board_spaces[6])} | #{formatter(ttt.board_spaces[7])} | #{formatter(ttt.board_spaces[8])}"
    return board
  end

end
