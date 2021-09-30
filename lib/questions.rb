class Questions

  def validate_user_input(question, valid_options)
      puts question
      user_answer = gets.chomp
      return user_answer.to_i if valid_options.include?(user_answer)
      puts "INVALID OPTION"
      validate_user_input(question, valid_options)
  end

end