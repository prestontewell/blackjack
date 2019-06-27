require_relative 'deck'

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

deck = Deck.new(SUITS, RANKS)

puts deck
puts deck.deck


puts "----------- Shuffle Deck ----------------"

puts deck.shuffle

puts "----------- deal card ----------------"

puts deck.deal_card

new_deck = []
new_deck.push(Card.new("Hearts", "8"))
new_deck.push(Card.new("Hearts", "9"))
new_deck.push(Card.new("Hearts", "10"))
puts new_deck
puts "------------ new deck -----------------"
deck.replace_with(new_deck)
puts deck
puts deck.deck
puts deck.shuffle
puts deck.shuffle
puts deck.deal_card
puts deck.class