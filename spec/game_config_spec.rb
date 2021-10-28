require 'game_config'
require 'questions'

describe GameConfig do
  describe "#configure_game_type" do
    it 'when user picks 1 Human for player 2 both players are human' do
      questions = Questions.new
      parsed_arguments = ArgumentParser.new([])

      allow(questions).to receive(:validate_user_input).and_return(1)
      game_config = GameConfig.new(questions, parsed_arguments)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:human)
    end

    it 'when user picks 2 cpu for player 2 both players are human' do
      questions = Questions.new
      parsed_arguments = ArgumentParser.new([])

      allow(questions).to receive(:validate_user_input).and_return(2)
      game_config = GameConfig.new(questions, parsed_arguments)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:computer)
    end
  end

  describe "#set_player_type" do
    it "sets player_one & player_two type to :human if given hvh flag" do
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(["hvh"])
      allow(questions).to receive(:validate_user_input).and_return(1)
      game_config = GameConfig.new(questions, parsed_arguments)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:human)

    end
    
    it "sets player_two type to :computer if given hvc flag" do
      questions = Questions.new
      parsed_arguments = ArgumentParser.new(["hvc"])
      allow(questions).to receive(:validate_user_input).and_return(1)
      game_config = GameConfig.new(questions, parsed_arguments)

      expect(game_config.player_two_type).to eq(:computer)
    end
  end

  describe "#configure_color_board" do
    it 'when user picks 1 sets @color to true' do
      questions = Questions.new
      parsed_arguments = ArgumentParser.new([])

      allow(questions).to receive(:validate_user_input).and_return(1)
      game_config = GameConfig.new(questions, parsed_arguments)

      expect(game_config.color).to eq(true)
    end
  end


end
