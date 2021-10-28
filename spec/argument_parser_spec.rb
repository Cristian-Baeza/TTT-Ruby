require 'argument_parser'

describe "ArgumentParser" do
  it "should set @game_type to nil if empty string is passed in" do
    parsed_arguments = ArgumentParser.new([""])

    expect(parsed_arguments.game_type).to be nil
  end
  
  it "should set @game_type to values passed in" do
    parsed_arguments = ArgumentParser.new(["hvh"])

    expect(parsed_arguments.game_type).to eq("hvh")
  end
  
  it "should set @color to true if color flag is passed in" do
    parsed_arguments = ArgumentParser.new(["hvh","color"])

    expect(parsed_arguments.color).to eq(true)
  end
  
  it "should set @color to false no color flag is passed in" do
    parsed_arguments = ArgumentParser.new(["hvh"])

    expect(parsed_arguments.color).to eq(nil)
  end
end