# ---
# source:
# - title: WDI Texas Hold 'em Poker Warmup
#   url: https://gist.github.com/kasun-maldeni/6816275e1bedeab95f2cc3671b085df8
# ---

# ## Texas Hold 'em Poker.

SUITS = %w[Clubs Diamonds Hearts Spades].freeze
RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze

class Card
  attr_reader :suit, :rank

  def self.[](suit, rank)
    new(suit: suit, rank: rank)
  end

  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
  end
end

deck = SUITS.product(RANKS).map { |card| Card[*card] }
deck = deck.shuffle

# Description:

# For those who want to know more about Texas Hold 'Em Poker or just need a
# refresher. Check Wikipedia Article on Texas Hold 'Em Poker

# For the first challenge we will simulate the dealing part of the game.

# ### Input:

# You will be asked how many players 2 to 8. You will always be one of the
# players and you are facing 1 to 7 other computer controlled players.

# ### Output:

# Display the 2 cards each player is dealt and the display the 5 community
# cards. Format is left up to you. (The exact method of the output a card. For
# my examples I am using verbal words but someone might use unicode symbols for
# the card suit or other. You design this as long as we can tell the cards
# apart it is all good)

# ### Example:

# ```
# How many players (2-8) ? 3
print "How many players (2-8) ? "
num_players = gets.chomp.to_i

# Your hand: 2 of Clubs, 5 of Diamonds
# CPU 1 Hand: Ace of Spades, Ace of Hearts
# CPU 2 Hand: King of Clubs, Queen of Clubs
players = []
player_hand = deck.shift(2)

num_players.times do |n|
  players[n] = deck.shift(2)
end

def display_hand(name, hand)
  # card1, card2 = hand
  # "#{name} Hand: #{card1.rank} of #{card1.suit}, #{card2.rank} of #{card2.suit}"
  cards = hand.map { |card| "#{card.rank} of #{card.suit}" }

  "#{name}: #{cards.join(', ')[0...-1]}"
end

puts display_hand("Your hand", player_hand)
players.each.with_index(1) { |player, i| puts display_hand("CPU #{i} Hand", player) }
puts "\n"

# Flop: 2 of Hearts, 5 of Clubs, Ace of Clubs
flop = deck.shift(3)
puts display_hand("Flop", flop)

# Turn: King of Hearts
turn = deck.shift
puts display_hand("Turn", [turn])

# River: Jack of Hearts
river = deck.shift
puts display_hand("River", [river])

# ```

# ### Dealing Cards:

# To keep things close to the game you will be dealing from 1 deck of standard
# playing cards. Once you deal that card you cannot deal it again. The exact
# method is part of the challenge and for you to decide, design and implement.

# In Texas Hold em you burn a card (draw and discard without looking at it)
# before you do the flop, turn and river. It removes these cards from the pool
# of possible cards that can be dealt. If you wish to show these cards (I did
# not in my example) then please for science go for it.

# ### Extension

# In the intermediate you will be asked to compare various hands of poker to
# find which hand is the winning hand.
