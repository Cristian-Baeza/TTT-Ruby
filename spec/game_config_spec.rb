require 'game_config'
require 'questions'
require 'env_var_parser'

describe GameConfig do
  describe "#configure_player_type" do
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

      expect(game_config.player_one_type).to eq(:cpu_hard)
      expect(game_config.player_two_type).to eq(:cpu_hard)
    end
  end

  describe "#configure_color_board" do
    it 'when user picks yes sets @color to true' do
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()

      allow(questions).to receive(:yes_or_no?).and_return(true)
      allow(questions).to receive(:multichoice).and_return(:human)
      game_config = GameConfig.new(questions, parsed_env_vars)

      expect(game_config.color).to eq(true)
    end
  end
  
  describe "#set_cpu_difficulty" do
    it 'returns easy or hard' do
      questions = Questions.new
      parsed_env_vars = EnvVarParser.new()

      allow(questions).to receive(:yes_or_no?).and_return(true)
      allow(questions).to receive(:multichoice).and_return(1)
      allow(questions).to receive(:multichoice).and_return(2)
      allow(questions).to receive(:multichoice).and_return(:easy)
      game_config = GameConfig.new(questions, parsed_env_vars)
      expected_answer = game_config.set_cpu_difficulty()

      expect(expected_answer).to eq(:easy)
    end
  end


end
