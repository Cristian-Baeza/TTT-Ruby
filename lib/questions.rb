class Questions
  attr_reader :player_counter

  def initialize()
    @player_counter = 2
  end

  def increase_player_counter
    @player_counter += 1
  end

  def current_player()
    @player_counter.even? ? "PLAYER X" : "PLAYER O"
  end


  def validate_user_input(question, valid_options)
      puts question + current_player()
      user_answer = gets.chomp
      if valid_options.include?(user_answer)
        increase_player_counter()
        return user_answer.to_i
      else
        puts "INVALID OPTION"
        validate_user_input(question, valid_options)
      end 
  end

end