require_relative "tictactoe"
require_relative "questions"

@questions = Questions.new
@game = Tic_Tac_Toe.new

def run_main_app()
  
  board_spaces = @game.board_spaces
  player1 = @game.player1
  player2 = @game.player2
  valid_options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  puts(@game.welcome_message())
  puts(@game.show_board(board_spaces))

  @game.take_turn(board_spaces, @questions.validate_user_input("PICK A SPACE ", valid_options, board_spaces ))

  winner = @game.check_for_winner?(board_spaces)
  
  if !winner
    run_main_app()
  else 
    puts("GAME OVER: #{winner} WINS!!")
  end


  


end