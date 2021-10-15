require 'questions'
# require "game_logic"

RSpec.describe Questions do

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
      expect(questions).to receive(:puts).twice.with(question)
      expect(questions).to receive(:puts).with("INVALID OPTION")

      answer = questions.validate_user_input(question, options)

      expect(answer).to eq(1)
  end
end

# describe "#turn_count" do
#   it "returns total number of board spaces used" do
#       questions = Questions.new
#       board = ["X", "O", " ", " ", " ", " ", " ", " ", " "]
#       board2 = ["X", "O", " ", "X", " ", " ", " ", " ", " "]
#       board3 = ["X", "O", " ", "X", " ", " ", " ", "O", " "]

#       expect(questions.turn_count(board)).to eq(2)
#       expect(questions.turn_count(board2)).to eq(3)
#       expect(questions.turn_count(board3)).to eq(4)
#   end
# end

# describe "#current_player" do
#   it "returns player X if spaces used on board is even" do
#       questions = Questions.new
#       board = ["X", "O", " ", " ", " ", " ", " ", " ", " "]

#       expect(questions.current_player(board)).to eq("PLAYER X")
#   end

#   it "returns player O if spaces used on board is odd" do
#       questions = Questions.new
#       board = ["X", "O", "X", " ", " ", " ", " ", " ", " "]

#       expect(questions.current_player(board)).to eq("PLAYER O")
#   end
# end





end