class ArgumentParser
  attr_accessor :game_type, :color
  @game_type = nil
  @color = nil

    def initialize(config_array)
      parse_game_type(config_array)
      parse_color_board(config_array)
    end

    def parse_color_board(config_array)
      config_array.each {|item|
        if item == "color"
          @color = true
        end
      }
    end

    def parse_game_type(config_array)
      config_array.each {|item|
        if item == "hvh"
          @game_type = item
        elsif item == "hvc"
          @game_type = item
        end
      }
    end

  end