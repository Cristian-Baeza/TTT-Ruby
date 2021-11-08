class EnvVarParser
  attr_accessor :game_type, :color
  @game_type = nil
  @color = nil

    def initialize()
      parse_game_type()
      parse_color_board()
    end

    def parse_color_board()
      if ENV["COLOR"] == "true"
        @color = true
      end
    end

    def parse_game_type()
      if ENV["GAME_TYPE"] == "hvh"
        @game_type = "hvh"
      elsif ENV["GAME_TYPE"] == "hvc"
        @game_type = "hvc"
      end
    end

  end