class ArgumentParser
  attr_accessor :game_type
  @game_type

    def initialize(game_type_user_chose)
      if game_type_user_chose[0] == ""
        @game_type = nil
      else
        @game_type = game_type_user_chose
      end
    end
end