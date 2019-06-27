require_relative 'card'
require_relative 'hand'

RSpec.describe Hand do

	before do
		@hand = Hand.new
	end

	it 'responds to dealt_cards' do
		expect(@hand).to respond_to(:dealt_cards)
	end

	describe '#add_card' do

		it 'responds to add_card' do
			expect(@hand).to respond_to(:add_card)
		end

		it 'should return correct properties of cards added' do
			card1 = Card.new('Hearts', '8')
			card2 = Card.new('Clubs', '7')

			@hand.add_card(card1)
			@hand.add_card(card2)
			expect(@hand.dealt_cards.size).to eq(2)

			expect(@hand.dealt_cards.first.suit).to eq('Hearts')
			expect(@hand.dealt_cards.last.suit).to eq('Clubs')
			expect(@hand.dealt_cards.first.rank).to eq('8')
			expect(@hand.dealt_cards.last.rank).to eq('7')

		end
	end

	describe '#get_value' do
		it 'responds to get_value' do
			expect(@hand).to respond_to(:get_value)
		end

		it 'returns correct value with no ace' do
			card1 = Card.new('Hearts', '8')
			card2 = Card.new('Clubs', '7')
			@hand.add_card(card1)
			@hand.add_card(card2)
			expect(@hand.get_value).to eq(15)
		end

		it 'returns correct value with ace and jack' do
			card1 = Card.new('Hearts', '8')
			card2 = Card.new('Clubs', 'Ace')
			@hand.add_card(card1)
			@hand.add_card(card2)
			expect(@hand.get_value).to eq(19)
		end
	end

	describe 'hand output' do
		it 'returns the correct output if show is true for all cards' do
			card1 = Card.new('Hearts', '8')
			card2 = Card.new('Clubs', '7')
			@hand.add_card(card1)
			@hand.add_card(card2)
			expect("#{@hand}").to eq("8 of Hearts, 7 of Clubs, Total value: 15")
		end

		it 'returns the correct output if show is false for one card' do
			card1 = Card.new('Hearts', 'Ace')
			card2 = Card.new('Clubs', '7')
			card1.show = false
			@hand.add_card(card1)
			@hand.add_card(card2)
			expect("#{@hand}").to eq("7 of Clubs, Total value: 7")
		end

	end
	
end
