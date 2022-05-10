require './questions.rb'
require './players.rb'

def turn
    createQuestion
    confirmAnswer
end

# Game setup
class Game
  def initialize
    # First players info
    puts "Please enter Player One's name!"
    playerOne = gets.chomp
    @playerOne = Player.new(playerOne)
    
    # Second players info
    puts "Please enter Player Two's name!"
    playerTwo = gets.chomp
    @playerTwo = Player.new(playerTwo)
end

# New question
def createQuestion = Question.new
  puts "NEW TURN!!!"
  if @playerOne.turn
    puts "#{@playerTwo.name}: #{@createQuestion.createQuestion}"   
  else
    puts "#{@playerOne.name}: #{@createQuestion.createQuestion}"
  end

end

# Confirm Answer
def confirmAnswer
  if gets.chomp.to_i == @createQuestion.answer
    if @playerOne.turn
      puts "Right!"
      @playerOne.turn = false
      @playerTwo.turn = true
    puts "#{@playerOne.name}: #{@playerOne.lives} of 3 versus #{@playerTwo.name}: #{@playerTwo.lives} of 3"
    confirmWinner
else
      puts "Right!"
      @playerOne.turn = true
      @playerTwo.turn = false
    puts "#{@playerOne.name}: #{@playerOne.lives} of 3 versus #{@playerTwo.name}: #{@playerTwo.lives} of 3"
    confirmWinner
  end
else
  if playerOne.turn
      @playerOne.lives -= 1
      puts "Wrong!"
      @playerOne.turn = false
      @playerTwo.turn = true
    puts "#{@playerOne.name}: #{@playerOne.lives} of 3 versus #{@playerTwo.name}: #{@playerTwo.lives} of 3"
    confirmWinner
  else
      @playerTwo.lives -= 1
      puts "Wrong!"
      @playerOne.turn = true
      @playerTwo.turn = false
    puts "#{@playerOne.name}: #{@playerOne.lives} of 3 versus #{@playerTwo.name}: #{@playerTwo.lives} of 3"
    confirmWinner
    end
  end
end 

# Confirm winner of the game
def confirmWinner
  if @playerOne.lives == 0
    puts "FIN!!!"
    puts "#{@playerTwo.name} is the winner!!!"
  elsif @playerTwo.lives == 0
    puts "FIN!!!"
    puts "#{@playerOne.name} is the winner!!!"
  else
    newTurn
  end
end