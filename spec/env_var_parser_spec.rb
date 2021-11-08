require 'env_var_parser'

describe "EnvVarParser" do
  it "should set @game_type to nil if no env variable for game_type is passed" do
    parsed_env_vars = EnvVarParser.new()

    expect(parsed_env_vars.game_type).to be nil
  end

  it "should set @game_type to value passed in" do
    cached_game_type = ENV["GAME_TYPE"]
    ENV["GAME_TYPE"] = "hvh"

    parsed_env_vars = EnvVarParser.new()

    expect(parsed_env_vars.game_type).to eq("hvh")

    ENV["GAME_TYPE"] = cached_game_type
  end


  it "should set @color to nil if no color env var is passed in" do
    cached_game_type = ENV["GAME_TYPE"]
    ENV["GAME_TYPE"] = "hvc"
    
    parsed_env_vars = EnvVarParser.new()

    expect(parsed_env_vars.color).to eq(nil)
    
    ENV["GAME_TYPE"] = cached_game_type
  end
  
  it "should set @color to true if env var is passed in" do
    cached_color = ENV["COLOR"]
    ENV["COLOR"] = 'true'
    parsed_env_vars = EnvVarParser.new()

    expect(parsed_env_vars.color).to eq(true)

    ENV["COLOR"] = cached_color
  end
  
end