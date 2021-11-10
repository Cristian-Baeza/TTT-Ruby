require 'questions'

RSpec.describe Questions do

  describe "#validate_user_input" do
    it "returns the value the user picked and change to integer" do
      questions = Questions.new

      allow(STDIN).to receive(:gets).and_return("1\n")

      answer = questions.validate_user_input("PICK A SPACE ", ["1", "2", "3", "4", "5", "6", "7", "8", "9"])

      expect(answer).to eq(1)
    end

    it "it loops asking the question until it gets a valid answer" do
      questions = Questions.new
      question = "PICK A SPACE "
      options = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      allow(STDIN).to receive(:gets).and_return("10\n", "1\n")
      expect(questions).to receive(:puts).twice.with(question)
      expect(questions).to receive(:puts).with("INVALID OPTION")

      answer = questions.validate_user_input(question, options)

      expect(answer).to eq(1)
    end
  end

  describe "#pick_a_number" do
    it "returns the value the user picked and change as an integer" do
      questions = Questions.new
      question = "PICK A SPACE"

      allow(STDIN).to receive(:gets).and_return("2\n")
      expect(questions).to receive(:puts).once.with(question)
      expect(questions).to receive(:print).once.with("( ")
      expect(questions).to receive(:print).once.with("2")
      expect(questions).to receive(:print).once.with(", ")
      expect(questions).to receive(:print).once.with("3")
      expect(questions).to receive(:puts).once.with(" )")

      answer = questions.pick_a_number(question, [2, 3])

      expect(answer).to eq(2)
    end

    it "it loops asking the question until it gets a valid answer" do
      questions = Questions.new
      question = "PICK A SPACE"
      allow(STDIN).to receive(:gets).and_return("4\n", "3\n")
      expect(questions).to receive(:puts).twice.with(question)
      expect(questions).to receive(:print).twice.with("( ")
      expect(questions).to receive(:print).twice.with("2")
      expect(questions).to receive(:print).twice.with(", ")
      expect(questions).to receive(:print).twice.with("3")
      expect(questions).to receive(:puts).twice.with(" )")
      expect(questions).to receive(:puts).with("INVALID OPTION")

      answer = questions.pick_a_number(question, [2, 3])

      expect(answer).to eq(3)
    end
  end

  describe "#multichoice" do
    it "returns the value the users picks" do
      questions = Questions.new

      expect(STDOUT).to receive(:puts).with("Pick one of these:")
      expect(STDOUT).to receive(:puts).with("1 : first")
      expect(STDOUT).to receive(:puts).with("2 : second")
      expect(STDOUT).to receive(:puts).with("3 : third")

      allow(STDIN).to receive(:gets).and_return("1\n")

      answer = questions.multichoice("Pick one of these:", [:first, :second, :third])

      expect(answer).to eq(:first)
    end

    it "it loops asking the question until it gets a valid answer" do
      questions = Questions.new

      expect(STDOUT).to receive(:puts).with("Pick one of these:").exactly(3).times
      expect(STDOUT).to receive(:puts).with("1 : first").exactly(3).times
      expect(STDOUT).to receive(:puts).with("2 : second").exactly(3).times
      expect(STDOUT).to receive(:puts).with("3 : third").exactly(3).times
      expect(STDOUT).to receive(:puts).with("INVALID OPTION").twice

      allow(STDIN).to receive(:gets).and_return("0\n", "4\n", "3\n")

      answer = questions.multichoice("Pick one of these:", [:first, :second, :third])

      expect(answer).to eq(:third)
    end
  end

  describe "#yes_or_no?" do
    it "returns true when user picks yes" do
      questions = Questions.new

      expect(STDOUT).to receive(:puts).with("does this test pass?")
      expect(STDOUT).to receive(:puts).with("1. Yes")
      expect(STDOUT).to receive(:puts).with("2. No")
      allow(STDIN).to receive(:gets).and_return("1\n")

      expect(questions.yes_or_no?("does this test pass?")).to be true
    end

    it "returns false when user picks no" do
      questions = Questions.new

      expect(STDOUT).to receive(:puts).with("does this test pass?")
      expect(STDOUT).to receive(:puts).with("1. Yes")
      expect(STDOUT).to receive(:puts).with("2. No")
      allow(STDIN).to receive(:gets).and_return("2\n")

      expect(questions.yes_or_no?("does this test pass?")).to be false
    end

    it "it loops asking the question until it gets a valid answer" do
      questions = Questions.new

      expect(STDOUT).to receive(:puts).with("does this test pass?").twice
      expect(STDOUT).to receive(:puts).with("1. Yes").twice
      expect(STDOUT).to receive(:puts).with("2. No").twice
      expect(STDIN).to receive(:gets).and_return("3\n", "1\n").twice

      expect(questions.yes_or_no?("does this test pass?")).to be true
    end
  end
end
