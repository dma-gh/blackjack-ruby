class Card
	def initialize(number, suit, face)
		@number = number
		@suit = suit
		@face = face		
	end

	def disp
		return "#{@face} of #{@suit} (#{number})"
	end

	def number
		return @number.to_i
	end

	def face
		return @face
	end
end

