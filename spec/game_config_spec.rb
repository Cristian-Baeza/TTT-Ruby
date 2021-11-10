require 'game_config'
require 'questions'
require 'env_var_parser'

describe GameConfig do
  describe "#configure_game_type" do
    it 'when user picks 1 Human for player 2 both players are human' do
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()

      allow(questions).to receive(:yes_or_no?).and_return(true)
      allow(questions).to receive(:multichoice).and_return(:human)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:human)
    end

    it 'when user picks 2 cpu for player 2 both players are computer' do
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()

      allow(questions).to receive(:yes_or_no?).and_return(true)
      allow(questions).to receive(:multichoice).and_return(:computer)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.player_one_type).to eq(:computer)
      expect(game_config.player_two_type).to eq(:computer)
    end
  end

  describe "#set_player_type" do
    it "sets player_one & player_two type to :human if given hvh flag" do
      cached_game_type = ENV["GAME_TYPE"]
      ENV["GAME_TYPE"] = "hvh"

      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()
      
      allow(questions).to receive(:yes_or_no?).and_return(true)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:human)

      ENV["GAME_TYPE"] = cached_game_type
    end
    
    it "sets player_two type to :computer if given hvc flag" do
      cached_game_type = ENV["GAME_TYPE"]
      ENV["GAME_TYPE"] = "hvc"
      
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()
      
      allow(questions).to receive(:yes_or_no?).and_return(true)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.player_two_type).to eq(:computer)

      ENV["GAME_TYPE"] = cached_game_type
    end
  end

  describe "#configure_color_board" do
    it 'when user picks 1 sets @color to true' do
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()

      allow(questions).to receive(:yes_or_no?).and_return(true)
      allow(questions).to receive(:multichoice).and_return(:human)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.color).to eq(true)
    end
  end


end
