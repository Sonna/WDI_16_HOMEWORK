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

pack = cards.dup
pack = pack.reverse
pack_itr = pack.each_slice(3)

players = {
  alfred: pack_itr.next,
  peter: pack_itr.next
}

case rand
when (0.0...0.7)
  players[:alfred] += pack_itr.next
  players[:peter] += pack_itr.next
else # when (0.7..1)
  players[:peter] += pack_itr.next
  players[:alfred] += pack_itr.next
end

puts players[:alfred]
puts players[:peter]
