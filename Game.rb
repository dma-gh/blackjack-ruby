require './Card.rb'
require './Deck.rb'

suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
cards = []

dealer_hand = []
player_hand = []

suits.each do |suit|
	13.times do |digit|
		digit = digit + 1	
		if digit.eql? 11 then digit = "Jack" end
		if digit.eql? 12 then digit = "Queen" end		
		if digit.eql? 13 then digit = "King" end

		new_card = Card.new(digit, suit)
		cards.push new_card
	end
end

#Implements Fisher-Yates Shuffle
cards.shuffle
