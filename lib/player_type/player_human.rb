class PlayerHuman

  def initialize(questions)
    @questions = questions
  end

  def take_turn(game_logic)
    valid_options = game_logic.open_spaces.map(&:to_s)
    user_choice = @questions.pick_a_number("PICK A SPACE #{game_logic.current_player()}:", valid_options)
    game_logic.take_turn(user_choice)
  end
end