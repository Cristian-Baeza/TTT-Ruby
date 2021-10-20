require 'game_config'
require 'questions'

describe GameConfig do
  describe "initializer" do
    it 'when user picks 1 Human for player 2 both players are human' do
      questions = Questions.new
      allow(questions).to receive(:validate_user_input).and_return(1)
      game_config = GameConfig.new(questions)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:human)
    end

    it 'when user picks 2 cpu for player 2 both players are human' do
      questions = Questions.new
      allow(questions).to receive(:validate_user_input).and_return(2)
      game_config = GameConfig.new(questions)

      expect(game_config.player_one_type).to eq(:human)
      expect(game_config.player_two_type).to eq(:computer)
    end
  end
end
