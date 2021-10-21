class ConsoleOutput

  TIE_MESSAGE = "GAME OVER: TIE!"

  def print_game_title_and_board(game, game_config)
    puts(welcome_message(game_config))
    puts(show_board(game))
  end

  def welcome_message(game_config)
    "-----------------------------\nWELCOME TO TIC-TAC-TOE\n" + "#{game_config.player_one_type} 1 IS X --- #{game_config.player_two_type} 2 IS O\n\n"
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
