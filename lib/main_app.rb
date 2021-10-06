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


  current_player = @game.current_player(board_spaces)
  user_choice = @questions.validate_user_input("PICK A SPACE #{current_player}", valid_options)

  if @game.position_taken?(board_spaces, user_choice)
    puts(@game.space_taken_message())
  else 
    @game.take_turn(board_spaces, user_choice)
  end


  winner = @game.check_for_winner?(board_spaces)

  
  if !winner
    run_main_app()
  else 
    puts("GAME OVER: #{winner} WINS!!")
  end


end