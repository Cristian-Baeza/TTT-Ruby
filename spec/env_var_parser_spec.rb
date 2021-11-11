require 'env_var_parser'

describe "EnvVarParser" do

  describe "#parse_player" do
    it "sets player to type nil if no env var is passed in" do
      parsed_env_vars = EnvVarParser.new()
      parsed_env_vars.parse_player("PLAYER_ONE", nil)

      expect(parsed_env_vars.player_one_type).to eq(nil)
    end
    
    it "sets player to type human if env var is passed in" do
      cached_player_one = ENV["PLAYER_ONE"]
      ENV["PLAYER_ONE"] = 'human'

      parsed_env_vars = EnvVarParser.new()

      expect(parsed_env_vars.player_one_type).to eq(:human)
      ENV["PLAYER_ONE"] = cached_player_one
    end
    
    it "sets player to type computer if env var is passed in" do
      cached_player_two = ENV["PLAYER_TWO"]
      ENV["PLAYER_TWO"] = 'cpu_hard'

      parsed_env_vars = EnvVarParser.new()

      expect(parsed_env_vars.player_two_type).to eq(:computer)
      ENV["PLAYER_TWO"] = cached_player_two
    end
  end

  describe "#parse_color_board" do
    it "should set @color to nil if no color env var is passed in" do
      parsed_env_vars = EnvVarParser.new()

      parsed_env_vars.parse_color_board()

      expect(parsed_env_vars.color).to eq(nil)
    end

    it "should set @color to true if env var is passed in" do
      cached_color = ENV["COLOR"]
      ENV["COLOR"] = 'true'
      parsed_env_vars = EnvVarParser.new()

      parsed_env_vars.parse_color_board()

      expect(parsed_env_vars.color).to eq(true)

      ENV["COLOR"] = cached_color
    end
end
  
end