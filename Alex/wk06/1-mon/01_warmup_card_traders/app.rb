# ---
# source:
# - title: WDI Week 4 Ruby Checkpoint
#   url: https://gist.github.com/kasun-maldeni/580aaa1f12e80881050e473099e70a39#file-wdi_wk4_ruby_checkpoint-md
# ---

# # Card Traders

# Alfred and Peter are best friends and Pokemon card traders. Each week they get
# together and decide to buy a new pack of Pokemon trading cards. Each pack has
# a total of 10 cards. Each card has the Pokemon's name and attack power.

# Alfred and Peter have not opened the pack yet, but it contains the following
# cards:

cards = [
  { name: "Pikachu",    attack: 40 },
  { name: "Rattata",    attack: 20 },
  { name: "Pidgeot",    attack: 60 },
  { name: "Alakazam",   attack: 80 },
  { name: "Butterfree", attack: 30 },
  { name: "Gengar",     attack: 70 },
  { name: "Moltres",    attack: 100 },
  { name: "Vulpix",     attack: 40 },
  { name: "Blastoise",  attack: 80 },
  { name: "Hitmonchan", attack: 50 }
]

# | Name       | Attack |
# |------------|--------|
# | Pikachu    |     40 |
# | Rattata    |     20 |
# | Pidgeot    |     60 |
# | Alakazam   |     80 |
# | Butterfree |     30 |
# | Gengar     |     70 |
# | Moltres    |    100 |
# | Vulpix     |     40 |
# | Blastoise  |     80 |
# | Hitmonchan |     50 |

# 1) Put the above cards into an appropriate data structure (so that you can
#    easily remove or change the order of cards if you needed to)
pack = [] # or {} ?
pack = cards.dup
# => [{:name=>"Pikachu", :attack=>40},
#     {:name=>"Rattata", :attack=>20},
#     {:name=>"Pidgeot", :attack=>60},
#     {:name=>"Alakazam", :attack=>80},
#     {:name=>"Butterfree", :attack=>30},
#     {:name=>"Gengar", :attack=>70},
#     {:name=>"Moltres", :attack=>100},
#     {:name=>"Vulpix", :attack=>40},
#     {:name=>"Blastoise", :attack=>80},
#     {:name=>"Hitmonchan", :attack=>50}]

# 2) They are about to open the pack of cards, and they have a ritual for
#    deciding who gets to keep each card in the pack.

# Do each of the following with your data structure:

# 2a) Firstly, keeping the cards faced down (so they cannot see), they reverse
#     the order of the cards.
pack = pack.reverse
# => [{:name=>"Hitmonchan", :attack=>50},
#     {:name=>"Blastoise", :attack=>80},
#     {:name=>"Vulpix", :attack=>40},
#     {:name=>"Moltres", :attack=>100},
#     {:name=>"Gengar", :attack=>70},
#     {:name=>"Butterfree", :attack=>30},
#     {:name=>"Alakazam", :attack=>80},
#     {:name=>"Pidgeot", :attack=>60},
#     {:name=>"Rattata", :attack=>20},
#     {:name=>"Pikachu", :attack=>40}]

# 2b) They then split the cards into groups of 3, so they end up with 4 piles of
#     cards (the first three with 3, and the last pile with just 1)
pack_itr = pack.each_slice(3)
# => #<Enumerator: ...>

# 2c) Alfred takes the first pile of cards, and Peter takes the second pile.
#     Create a new data structure for Alfred and Peter and pass them the cards.
alfred = pack_itr.next # => [{:name=>"Hitmonchan", :attack=>50}, {:name=>"Blastoise", :attack=>80}, {:name=>"Vulpix", :attack=>40}]
peter = pack_itr.next # => [{:name=>"Moltres", :attack=>100}, {:name=>"Gengar", :attack=>70}, {:name=>"Butterfree", :attack=>30}]

# 2d) At this point only two piles of cards are leftover, one with 3 cards, and
#     one with 1 card. They decide to arm-wrestle, where the winner gets the
#     pile with 3 cards, and the loser gets the remaining pile. Alfred wins 7
#     out of 10 times, so write some randomising code that decides which pile
#     each person gets.
to_alfred, to_peter = [pack_itr.next, pack_itr.next].shuffle
# => [[{:name=>"Pikachu", :attack=>40}],
#     [{:name=>"Alakazam", :attack=>80},
#      {:name=>"Pidgeot", :attack=>60},
#      {:name=>"Rattata", :attack=>20}]]

alfred += to_alfred
# => [{:name=>"Pikachu", :attack=>40}]

peter += to_peter
# => [{:name=>"Alakazam", :attack=>80},
#     {:name=>"Pidgeot", :attack=>60},
#     {:name=>"Rattata", :attack=>20}]
