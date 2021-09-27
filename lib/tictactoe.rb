class Tic_Tac_Toe
  def run_app()
    puts("Welcome to Tic-Tac-Toe")
  end

  def show_empty_board
    row = ["   " +  "|" +  "   " + "|" + "   "]
    separator = "-----------"
    puts row
    puts separator
    puts row
    puts separator
    puts row
  end

end

