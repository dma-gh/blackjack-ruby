require './Card.rb'
require './Hand.rb'

suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
cards = []
victor = ""

dealer_hand = Hand.new
player_hand = Hand.new

player_money = 20
player_bet = 0

suits.each do |suit|
	13.times do |digit|
		digit = digit + 1

		face = digit

		if digit.eql? 1 then face = "Ace" end
		if digit.eql? 11 then face = "Jack" end
		if digit.eql? 12 then face = "Queen" end		
		if digit.eql? 13 then face = "King" end

		if digit > 10 then digit = 10 end

		new_card = Card.new(digit, suit, face)
		cards.push new_card
	end
end

#Implements Fisher-Yates Shuffle
cards.shuffle!

#In casino Blackjack, the player plays until they're ready to stand, and then the 
#dealer plays. This gives a large house advantage, thus this game follows the
#traditional rules
while cards.length > 0

	if victor.eql? "Player" then
		player_money += (player_bet * 2)
	end

	puts "New Game!"

	puts "You have $#{player_money}"
	if player_money < 0 then puts "You're in debt due to gambling! Stick to the computer!" end
	puts "What would you like to bet this round?"

	player_bet = gets.chomp.to_i
	player_money -= player_bet

	unless victor.empty? then puts "#{victor} wins!" end
	victor = ""
	
	dealer_hand.clear
	player_hand.clear

	2.times do |index|
		dealer_hand.add cards.shuffle!.pop
		player_hand.add cards.shuffle!.pop
	end

	while victor.eql? ""

		puts "------------------------"

		puts "\nThe dealer is holding"
		dealer_hand.disp

		puts "\nYou are holding: "
		player_hand.disp

		puts "Would you like to hit (1) or stand (2)?"
		action = gets

		if action.chop.eql? "1" then
			player_hand.add cards.shuffle!.pop
		end

		if action.chop.eql? "2" then

			while dealer_hand.sum < player_hand.sum
				dealer_hand.add cards.shuffle!.pop

				puts "\nThe dealer is holding"
                		dealer_hand.disp

                		puts "\nYou are holding: "
                		player_hand.disp

				if dealer_hand.sum > 21 then
					victor = "Player" 
				end
			end

			#The player chose to stand, beyond a final check for player>21,
			#this is the game ultimatum
			if player_hand.sum > dealer_hand.sum then
				victor = "Player"
			else
				victor = "Dealer"
			end
		end

		if player_hand.sum > 21 then
			victor = "Dealer"

			puts "\nThe dealer is holding"
                	dealer_hand.disp

                	puts "\nYou are holding: "
                	player_hand.disp

		elsif dealer_hand.sum > 21
			victor = "Player"

	                puts "\nThe dealer is holding"
        	        dealer_hand.disp

                	puts "\nYou are holding: "
               		player_hand.disp
		end
	end
end



