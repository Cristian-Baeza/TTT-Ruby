require 'questions'

RSpec.describe Questions do
describe "#increase_player_counter" do
  it "increases global variable of player_counter" do
    questions = Questions.new
    questions.increase_player_counter

    expect(questions.player_counter).to eq(3)
  end
end

describe "#validate_user_input" do
  it "returns the value the user picked and change to integer" do
      questions = Questions.new
      allow(questions).to receive(:gets).and_return("1\n")

      answer = questions.validate_user_input("PICK A SPACE ", ["1", "2", "3", "4", "5", "6", "7", "8", "9"])

      expect(answer).to eq(1)
  end

  it "it loops asking the question until it gets a valid answer" do
      questions = Questions.new  
      question = "PICK A SPACE "
      options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      

      allow(questions).to receive(:gets).and_return("10\n", "1\n")
      expect(questions).to receive(:puts).twice.with(question + questions.current_player())
      expect(questions).to receive(:puts).with("INVALID OPTION")

      answer = questions.validate_user_input(question, options)

      expect(answer).to eq(1)
  end
end

describe "#current_player" do
  it "returns player X if global variable is even" do
      questions = Questions.new
      
      expect(questions.current_player()).to eq("PLAYER X")
  end

  it "returns player O if global variable is odd" do
      questions = Questions.new
      questions.increase_player_counter()
      
      expect(questions.current_player()).to eq("PLAYER O")
  end
end





end