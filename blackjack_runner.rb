require_relative 'blackjack'

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

game = Blackjack.new SUITS, RANKS

game.deal
puts game.show_hands
player_cards = game.player_hand.dealt_cards


while game.player_hand.get_value <= 21 do
	unless player_cards.first.rank == 10 && player_cards.last.rank == 'Ace' || 
	player_cards.last.rank == 10 && player_cards.first.rank == 'Ace'	
		puts "Do you want to hit(1) or stand(2)?"
		res = gets.chomp
		if res == '1'
			puts
			game.hit
			puts "Player hand: " + game.player_hand.to_s
			puts "Player hand: " + game.dealer_hand.to_s
		elsif res == '2'
			puts
			game.stand
			puts "Player hand: " + game.player_hand.to_s
			puts "Player hand: " + game.dealer_hand.to_s
			break
		end
	else
		game.stand
		puts
		puts "Player hand: " + game.player_hand.to_s
		puts "Player hand: " + game.dealer_hand.to_s
		break
	end	
end

puts game.set_result