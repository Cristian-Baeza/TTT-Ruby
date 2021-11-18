#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require "cli_questions"
Dir["#{File.dirname(__FILE__)}/lib**/**/*.rb"].each {|file| require file }


parsed_env_vars = EnvVarParser.new()
questions = Questions
game_config = GameConfig.new(questions, parsed_env_vars)
game_logic = GameLogic.new
console_output = ConsoleOutput.new(game_config)

player_one_type = case game_config.player_one_type
when :human
  PlayerHuman.new(questions)
when :cpu_easy
  PlayerCpu.new(ComputerLogicEasy.new(game_logic))
when :cpu_hard
  PlayerCpu.new(ComputerLogicHard.new(game_logic))
end

player_two_type = case game_config.player_two_type
when :human
  PlayerHuman.new(questions)
when :cpu_easy
  PlayerCpu.new(ComputerLogicEasy.new(game_logic))
when :cpu_hard
  PlayerCpu.new(ComputerLogicHard.new(game_logic))
end


players = { X: player_one_type, O: player_two_type }

game_loop = GameLoop.new(questions, players, game_logic, game_config, console_output)

game_loop.run()


