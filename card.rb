class Card

	attr_accessor :suit, :rank, :show
	SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
	RANKS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

	def initialize suit, rank
		@show = true
		if SUITS.include?(suit) && RANKS.include?(rank)
			@suit = suit
			@rank = rank
		else
			@suit = "UNKNOWN"
			@rank = "UNKNOWN"
		end
	end

	def to_s
		if show
			"#{rank} of #{suit}"
		else
			"Card is face down."
		end
	end

end