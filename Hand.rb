class Hand
	@hand_contents = []

	def initialize
	end

	def sum
		
		sum = 0
		
		@hand_contents.each do |card|
			sum += card.number
		end
		
		return sum
	end

	def add(card)
		@hand_contents.push(card)
	end

	def array
		return @hand_contents
	end

	def clear
		@hand_contents = []
	end

	def disp
		@hand_contents.each do |card|
			puts card.disp
		end
	end
end