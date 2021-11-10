class Questions

  def validate_user_input(question, valid_options)
      puts question
      user_answer = $stdin.gets.chomp
      if valid_options.include?(user_answer)
        return user_answer.to_i
      else
        puts "INVALID OPTION"
        validate_user_input(question, valid_options)
      end
  end

  def pick_a_number(question, valid_numbers)
    while true do
      puts question
      print "( "
      valid_numbers.each_with_index do | number, index |
        print "#{number}"
        print ", " unless index == valid_numbers.count - 1
      end
      puts " )"
      user_answer = $stdin.gets.chomp.to_i
      return user_answer if valid_numbers.include?(user_answer)
      puts "INVALID OPTION"
    end
  end

  def multichoice(question, valid_options)
    while true do
      puts question
      valid_options.each_with_index do | option, index |
        puts "#{index + 1} : #{option}"
      end
      user_answer = $stdin.gets.chomp.to_i - 1
      return valid_options[user_answer] if user_answer > -1 && user_answer < valid_options.count
      puts "INVALID OPTION"
    end
  end

  def yes_or_no?(question)
    while true do
      $stdout.puts question
      $stdout.puts "1. Yes"
      $stdout.puts "2. No"
      input = $stdin.gets.chomp.to_i
      return 1 == input if input == 1 || input == 2
    end
  end
end
