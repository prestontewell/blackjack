require_relative 'deck'
require_relative 'hand'

class Blackjack

	attr_reader :player_hand, :dealer_hand, :deck, :playing
	attr_accessor :current_gamer

	def initialize(suits, ranks)
		@player_hand = nil
		@dealer_hand = nil
		@deck = Deck.new suits, ranks
		@deck.shuffle
		@playing = false
		@current_gamer = ""
	end

	def deal
		@dealer_hand = Hand.new
		@player_hand = Hand.new

		2.times do
			@dealer_hand.add_card(@deck.deal_card)
			@player_hand.add_card(@deck.deal_card)
		end
		@dealer_hand.dealt_cards.first.show = false
		@playing = true
		player_cards = @player_hand.dealt_cards
		values_of_ten = ['10', 'Jack', 'Queen', 'King']

		if values_of_ten.include?(player_cards.first.rank) && player_cards.last.rank == 'Ace' || values_of_ten.include?(player_cards.last.rank) && player_cards.first.rank == 'Ace'
			@current_gamer = 'Dealer'
			
		end
	end

	def stand
	end

	def hit
	end

	def show_hands
	end

	def set_result
	end

end

