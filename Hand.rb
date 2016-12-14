class Hand
	#Array to hold the card objects
	@hand_contents = []

	#no innate variables
	def initialize
	end

	#gets the total of the card values, lots of DRY with this
	def sum
		#sets sum at 0
		sum = 0		

		#adds each card to the sum
		@hand_contents.each do |card|
			sum += card.number
		end

		@hand_contents.each do |card|
			if card.number.eql? 1 then
				if sum + 10 <= 21 then
					sum += 10
				end
			end
		end

		#return the sum		
		return sum
	end

	#adds a card to the array via push
	def add(card)
		@hand_contents.push(card)
	end

	#returns the actual array
	def array
		return @hand_contents
	end

	#clears the hand
	def clear
		@hand_contents = []
	end

	#prints all of the cards in the hand using the pretty card output
	def disp
		@hand_contents.each do |card|
			puts card.disp
		end

		puts "Total: #{self.sum}"
	end
end
