require 'argument_parser'

describe "ArgumentParser" do
  it "should set parsed values to nil if empty string is passed in" do
    parsed_arguments = ArgumentParser.new("")

    expect(parsed_arguments.game_type[0]).to be nil
  end
  
  it "should set @game_type to values passed in" do
    parsed_arguments = ArgumentParser.new("hvh")

    expect(parsed_arguments.game_type).to eq("hvh")
  end
end