class Card
	#Has to be initialized with variables
	def initialize(number, suit, face)
		#card value
		@number = number
		#card suit
		@suit = suit
		#card superficial name
		@face = face		
	end

	def disp
		#States the card in a pretty way
		return "#{@face} of #{@suit} (#{number})"
	end

	def number
		#gets the value
		return @number.to_i
	end

	def face
		#states the card's face
		return @face
	end
end

