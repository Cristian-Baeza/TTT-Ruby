require 'argument_parser'

describe "ArgumentParser" do
  it "should set parsed values to nil if emptry string is passed in" do
    parsed_arguments = ArgumentParser.new("")

    expect(parsed_arguments.game_type).to be nil
  end
end