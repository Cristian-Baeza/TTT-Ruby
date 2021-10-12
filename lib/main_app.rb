require_relative "tictactoe"
require_relative "questions"

@questions = Questions.new
@game = Tic_Tac_Toe.new

def run_main_app()

  player1 = @game.player1
  player2 = @game.player2
  valid_options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  puts(@game.welcome_message())
  puts(@game.show_board())


  current_player = @game.current_player()
  user_choice = @questions.validate_user_input("PICK A SPACE #{current_player}", valid_options)

  if @game.position_taken?(user_choice)
    puts(@game.space_taken_message())
  else 
    @game.take_turn(user_choice)
  end


  winner = @game.check_for_winner?

  if !winner
    run_main_app()
  else
    puts(@game.show_board()) 
    puts("GAME OVER: #{winner} WINS!!")
  end


end