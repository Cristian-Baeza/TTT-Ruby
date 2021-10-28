require 'questions'

RSpec.describe Questions do

describe "#validate_user_input" do
  xit "returns the value the user picked and change to integer" do
      questions = Questions.new
      
      allow(questions).to receive(:gets).and_return("1\n")

      answer = questions.validate_user_input("PICK A SPACE ", ["1", "2", "3", "4", "5", "6", "7", "8", "9"])

      expect(answer).to eq(1)
  end

  xit "it loops asking the question until it gets a valid answer" do
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

end