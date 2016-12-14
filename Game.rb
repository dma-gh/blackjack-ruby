require './Card.rb'
require './Hand.rb'

suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
cards = []
victor = ""

#Creates instances of the Hand class for each player
dealer_hand = Hand.new
player_hand = Hand.new

#Initializes player money variable, and player bet variable
player_money = 20
player_bet = 0

#This fills the cards array with cards
#Loops through each suit
suits.each do |suit|
	#Loops through each number
	13.times do |digit|
		#There's no zero card!
		digit = digit + 1

		face = digit

		#Sets special faces
		if digit.eql? 1 then face = "Ace (1 | 11)" end
		if digit.eql? 11 then face = "Jack" end
		if digit.eql? 12 then face = "Queen" end		
		if digit.eql? 13 then face = "King" end

		#Face cards are all worth ten
		if digit > 10 then digit = 10 end

		#creates an instance of the card before adding it
		new_card = Card.new(digit, suit, face)
		cards.push new_card
	end
end

#Implements Fisher-Yates Shuffle
cards.shuffle!

#In Blackjack, the player plays until they're ready to stand, and then the 
#dealer plays.

#The game lasts for one deck of cards
while cards.length > 0

	#uses victor to check who won the previous round
	#money has already been subtracted, so if it's
	#dealer or none, no consequences!
	if victor.eql? "Player" then
		player_money += (player_bet * 2)
	end

	#Prints the last victor, does nothing if game 1	
	unless victor.empty? then puts "\n#{victor} wins!" end

	#Tells the player a new game is starting
	puts "New Game!"

	#Tells the player their balance
	puts "You have $#{player_money}"
	
	#Scolds player for losing more than they own, if they have
	if player_money < 0 then puts "You're in debt due to gambling! Stick to the computer!" end

	puts "What would you like to bet this round?"

	#Gets player bet from STDIO and subtracts it from their balance
	player_bet = gets.chomp.to_i
	player_money -= player_bet

	#resets the victor
	victor = ""
	
	#Resets the hands
	dealer_hand.clear
	player_hand.clear

	#Deals two cards to each player
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

		#if player chose to hit
		if action.chop.eql? "1" then
			#deal them a card
			player_hand.add cards.shuffle!.pop
		end

		#if player chose to stand
		if action.chop.eql? "2" then

			#the dealer will try to draw until they're ahead or bust
			while dealer_hand.sum < player_hand.sum
				dealer_hand.add cards.shuffle!.pop

				puts "\nThe dealer is holding"
                		dealer_hand.disp

                		puts "\nYou are holding: "
                		player_hand.disp
			end

			#The player chose to stand, beyond a final check for player>21,
			#this is the game ultimatum
			if player_hand.sum > dealer_hand.sum then
				victor = "Player"
			else
				victor = "Dealer"
			end
		end

		#checks for a player bust, dealer bust only matters if the
		#player stood
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



