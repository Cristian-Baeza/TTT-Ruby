class EnvVarParser
  attr_accessor :color, :player_one_type, :player_two_type

  @player_one_type = nil
  @player_two_type = nil
  @color = nil

    def initialize()
      parse_color_board()
      @player_one_type = parse_player("PLAYER_ONE")
      @player_two_type = parse_player("PLAYER_TWO")
    end

    def parse_color_board()
      if ENV["COLOR"] == "true"
        @color = true
      end
    end

    def parse_player(player)
      case ENV[player]
      when "human"
        :human
      when "cpu_easy"
        :cpu_easy
      when "cpu_hard"
        :cpu_hard
      end
    end

  end