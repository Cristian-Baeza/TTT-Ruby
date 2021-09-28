require_relative "tictactoe"

def run_main_app()
  game = Tic_Tac_Toe.new
  board_spaces = game.board_spaces
  player1 = game.player1
  player2 = game.player2

  puts(game.welcome_message())
  puts(game.show_board(board_spaces))

  game.take_turn(board_spaces, player1)
  puts(game.show_board(board_spaces))
  
  game.take_turn(board_spaces, player2)
  puts(game.show_board(board_spaces))

  run_main_app()


end