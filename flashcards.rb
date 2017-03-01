# Think about this:
# 1. What kind of classes do you need?
# 2. How can you link the question and answer?

# Start coding here.
class Card
	attr_accessor :question, :answer

	def initialize(question, answer)
		@question = question
		@answer = answer
	end

end

class Deck

	attr_accessor :cards
	
	def initialize(file)
		@file = file
		@cards = nil
	end

	def cards

		@cards = []

		arr = []
		IO.foreach("flashcard_samples.txt") { |x| arr << x}

		counter = 0
		while counter < arr.length
			question = arr[counter].chomp("\n")
			answer = arr[counter + 1].chomp("\n")
			new_card = Card.new(question, answer)
			@cards << new_card
			counter += 3
		end
		return @cards if @cards
	end

	def flash_card
		rand_pick = rand(@cards.length)
		return @cards[rand_pick]
	end

	def question_answer

	end

end


class Game
  def self.run
    deck = Deck.new("flashcard_samples.txt")
	deck.cards
	puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!"
	puts "Enter exit to exit the game."

	
	
	user_input =""
	
	while user_input != "exit"
		puts "Definition:"
		new_card = deck.flash_card
		question = new_card.question
		answer = new_card.answer
		puts question
		puts
		
		counter = 0
		while counter < 3
			print "Guess: "
			user_input = gets.chomp.to_s

			if user_input == "exit"
				break
			elsif user_input == answer
				puts "Correct!"
				break
			elsif user_input != answer
				puts "Incorrect! Try again."
			end
		counter +=1
		end
	end
  end
end

Game.run