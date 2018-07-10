# require "pry"

# "oxo"
# "hannah"
# "racecar"
# "a toyota"
# "evan"

# exhibit1 = "oxo"
# exhibit1 = "hannah"
# exhibit1 = "evan"
exhibit1 = "a toyota"
exhibit1.reverse() # => "atoyot a"

'a toyota'.split(' ').join('') # => "atoyota"
exhibit1.gsub('a', 'n') # => "n toyotn"
exhibit1.gsub('o', 'x') # => "a txyxta"
exhibit1.gsub(/[^a-z]/, '') # => "atoyota"
exhibit1.gsub(/[\w]*=/, '') # => "a toyota"

"apple" == "orange" # => false
'6' == 6 # => false
'6'.to_i == 6 # => true

if exhibit1 == exhibit1.reverse()
  puts("yes")
else
  puts("no")
end

# left class for interview

# binding.pry

puts('just me')

# regex - regular expressions
# /[\w]*=/

# >> no
# >> just me
