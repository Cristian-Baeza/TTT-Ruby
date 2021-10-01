class Tic_Tac_Toe
    attr_reader :board_spaces, :player1, :player2
    
    WELCOME_MESSAGE = "-----------------------------\n WELCOME TO TIC-TAC-TOE\n" + "PLAYER 1 IS X --- PLAYER 2 IS O\n\n"
    

  def initialize()
    @board_spaces = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player1 = "X"
    @player2 = "O"
    @player_counter = 2
  end


  def welcome_message
    WELCOME_MESSAGE
  end


  def take_turn(board_spaces, choice)
    if @player_counter.even?
      board_spaces[choice - 1] = @player1
      @player_counter += 1
    elsif @player_counter.odd?
      board_spaces[choice - 1] = @player2
      @player_counter += 1
    end
  end


  def show_board(board_spaces)
    board = ""
    board += " #{board_spaces[0]} | #{board_spaces[1]} |  #{board_spaces[2]}\n"
    board += "-----------\n"
    board += " #{board_spaces[3]} | #{board_spaces[4]} |  #{board_spaces[5]}\n"
    board += "-----------\n"
    board += " #{board_spaces[6]} | #{board_spaces[7]} |  #{board_spaces[8]}"
    return board
  end




end

