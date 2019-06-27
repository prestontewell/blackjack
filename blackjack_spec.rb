require_relative 'blackjack'

RSpec.describe Blackjack do 

	describe "instance methods" do

		SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
		RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

		before do
			@blackjack = Blackjack.new SUITS, RANKS
		end

		it 'should respond to player_hand' do
			expect(@blackjack).to respond_to(:player_hand)
		end

		it 'should respond to dealer_hand' do
			expect(@blackjack).to respond_to(:dealer_hand)
		end

		it 'should respond to playing' do
			expect(@blackjack).to respond_to(:playing)
		end

		it 'should respond to current_gamer' do
			expect(@blackjack).to respond_to(:current_gamer)
		end

		it 'should respond to deal' do
			expect(@blackjack).to respond_to(:deal)
		end

		it 'should respond to hit' do
			expect(@blackjack).to respond_to(:hit)
		end

		it 'should respond to stand' do
			expect(@blackjack).to respond_to(:stand)
		end

		it 'should respond to show_hands' do
			expect(@blackjack).to respond_to(:show_hands)
		end

		it 'should respond to set_result' do
			expect(@blackjack).to respond_to(:set_result)
		end
	end
	
	describe 'Dealing cards' do

		before do
			@blackjack = Blackjack.new SUITS, RANKS
			@blackjack.deal
			@player_cards = @blackjack.player_hand.dealt_cards
			@dealer_cards = @blackjack.dealer_hand.dealt_cards
		end

		it 'Should return 2 cards for the dealer and the player' do
			expect(@player_cards.count).to eq(2)
			expect(@dealer_cards.count).to eq(2)
		end

		it 'Should not display the dealer first card' do
			expect(@dealer_cards.first.show).to eq(false)
		end

		it 'Should end the player turn if blackjack is dealt' do
			card1 = Card.new('Hearts', '3')
			card2 = Card.new('Hearts', 'Ace')
			card3 = Card.new('Hearts', '4')
			card4 = Card.new('Hearts', 'Jack')


			@blackjack = Blackjack.new SUITS, RANKS
			new_deck = [card2, card1, card4, card3]
			@blackjack.deck.replace_with(new_deck)
			@blackjack.deal
			expect(@blackjack.current_gamer).to eq('Dealer')
		end

		describe 'Hitting a hand' do

			before do
				@blackjack = Blackjack.new SUITS, RANKS
				@blackjack.deal 
				@player_cards = @blackjack.player_hand.dealt_cards
				@dealer_cards = @blackjack.dealer_hand.dealt_cards
			end

			it 'Should only hit if playing is true' do
				expect(@blackjack.playing).to eq true
			end

			it 'Should return 3 cards for the player and 2 cards for the dealer' do
				@blackjack.hit
				expect(@player_cards.count).to eq 3
				expect(@dealer_cards.count).to eq 2

			end

			it 'Should return if the player has busted' do
				card1 = Card.new('Hearts', '3')
				card2 = Card.new('Hearts', 'King')
				card3 = Card.new('Hearts', '10')
				card4 = Card.new('Hearts', 'Jack')	
				card5 = Card.new('Hearts', 'Jack')	
				card6 = Card.new('Hearts', 'Jack')	

				@blackjack = Blackjack.new SUITS, RANKS
				new_deck = [card1, card2, card3, card4, card5, card6]
				@blackjack.deck.replace_with(new_deck)
				@blackjack.deal
				@blackjack.hit
				expect(@blackjack.result).to eq('Player busted!')
			end

			it 'Should return if the dealer has busted' do
				card1 = Card.new('Hearts', '3')
				card2 = Card.new('Hearts', 'King')
				card3 = Card.new('Hearts', 'Ace')
				card4 = Card.new('Hearts', 'Jack')	
				card5 = Card.new('Hearts', 'Jack')	
				card6 = Card.new('Hearts', 'Jack')	

				@blackjack = Blackjack.new SUITS, RANKS
				new_deck = [card1, card2, card3, card4, card5, card6]
				@blackjack.deck.replace_with(new_deck)
				@blackjack.deal
				@blackjack.current_gamer = 'Dealer'
				@blackjack.hit
				expect(@blackjack.result).to eq('Dealer busted!')
				
			end


		end



	end

end
