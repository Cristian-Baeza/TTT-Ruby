class Questions

  def validate_user_input(question, valid_options)
      puts question
      user_answer = gets.chomp
      if valid_options.include?(user_answer)
        return user_answer.to_i
      else
        puts "INVALID OPTION"
        validate_user_input(question, valid_options)
      end 
  end



end