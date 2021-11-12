class EnvVarParser
  attr_accessor :color, :player_one_type, :player_two_type, :cpu_difficulty_player_one, :cpu_difficulty_player_two

  @player_one_type = nil
  @player_two_type = nil
  @color = nil
  @cpu_difficulty_player_one = :not_set
  @cpu_difficulty_player_two = :not_set

    def initialize()
      parse_color_board()
      @player_one_type = parse_player("PLAYER_ONE", @cpu_difficulty_player_one )
      @player_two_type = parse_player("PLAYER_TWO", @cpu_difficulty_player_two)
    end

    def parse_color_board()
      if ENV["COLOR"] == "true"
        @color = true
      end
    end

    def parse_player(player, cpu_player_difficulty)
      case ENV[player]
      when "human"
        :human
      when "cpu_easy"
        cpu_player_difficulty = :easy
        :computer
      when "cpu_hard"
        cpu_player_difficulty = :hard
        :computer
      end
    end

  end