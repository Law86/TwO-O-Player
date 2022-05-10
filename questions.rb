class Question
  attr_reader :createQuestion, :answer 

  def initialize
    number1 = rand(1..20)
    number2 = rand(1..20)
    @createQuestion = "what does #{@number1} plus #{number2} equal?"
    @answer = number1 + number2
  end

end