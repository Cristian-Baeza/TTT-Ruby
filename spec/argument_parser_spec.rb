require 'argument_parser'

describe "ArgumentParser" do
  it "should set parsed values to nil if emptry string is passed in" do
    parsed_arguments = ArgumentParser.new("")

    expect(parsed_arguments.game_type[0]).to be nil
  end
  
  # xit "should set @game_type to values passed in" do
  #   parsed_arguments = ArgumentParser.new("hvh")

  #   expect(parsed_arguments.game_type[0]).to eq(["hvh"])
  # end
end