class Hand
	attr_accessor :dealt_cards

	VALUES = {
		'2': 2,
		'3': 3, 
		'4': 4, 
		'5': 5, 
		'6': 6, 
		'7': 7, 
		'8': 8, 
		'9': 9, 
		'10': 10, 
		'Jack': 10, 
		'Queen': 10, 
		'King': 10, 
		'Ace': 1, 

	}

	def initialize
		@dealt_cards = []
	end

	def add_card(card)
		@dealt_cards << card
	end

	def get_value
		# card_ranks = []
		# result = 0
		# @dealt_cards.each do |card|
		# 	card_ranks << card.rank
		# end
		card_ranks = @dealt_cards.map { |card| card.rank }
		result = card_ranks.reduce(0) { |acc, rank| acc + VALUES[rank.to_sym]}
		if card_ranks.include?("Ace") && @dealt_cards.first.show
			result += 10 if result + 10 <= 21
		end
		# card_ranks.each do |rank|
			# rank = rank.to_sym
			# result += VALUES[rank]
		# end
		return result
	end

	def to_s
		report = ""

		dealt_cards.each {|card| report += card.to_s + ", " if card.show}

		if dealt_cards.first.show == false
			first_value = VALUES[@dealt_cards.first.rank.to_sym]
			report + "Total value: " + (get_value - first_value).to_s
		else
			report + "Total value: " + get_value.to_s
		end
	end

end
