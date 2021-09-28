class Tic_Tac_Toe
  def run_app()
    puts("WELCOME TO TIC-TAC-TOE!\n\n")
    puts(show_empty_board())
  end

  def show_empty_board
    row = "   " +  "|" +  "   " + "|" + "   "
    separator = "-----------"
    board = row + "\n" + separator + "\n" + row + "\n" + separator + "\n" + row
    return board
  end

end

