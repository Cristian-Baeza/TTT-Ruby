require 'tic_tac_toe_logic'

class GameLogic

  def initialize()
    @game_board_data = TicTacToeLogic::GameBoardData.new
  end

  def board_spaces
    @game_board_data
  end

  def take_turn(choice)
    @game_board_data.play_move(choice - 1)
  end

  def best_move
    @game_board_data.best_move + 1
  end

  def open_spaces
    spaces_available_index = @game_board_data.open_spaces
    spaces_available_index.map {|each| each + 1}
  end

  def is_there_winner?
    @game_board_data.winner
  end

  def turn_count
    @game_board_data.turn_count
  end

  def current_player
      @game_board_data.current_player
  end

  def board_full?
    @game_board_data.board_full?
  end

  def is_game_over?
    @game_board_data.game_over?
  end

end

