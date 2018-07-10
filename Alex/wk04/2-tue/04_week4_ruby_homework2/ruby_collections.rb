# ---
# source:
# - title: ruby_collections.md
#   url: https://gist.github.com/epoch/e6e4f013cd88cd88f65c88d1dec3be08
# ---

# ### Arrays

# Starting with the following array...

# ```rb
planeteers = ["Earth", "Wind", "Captain Planet", "Fire", "Water"]
# ```

# Access the second value in `planeteers`.

# ```rb
# Your answer here
planeteers[1] # => "Wind"
# ```

# Add "Heart" to the end of `planeteers`.

# ```rb
# Your answer here
planeteers[-1] # => "Water"
planeteers.last # => "Water"
# ```

# Combine `planeteers` with `rangers = ["Red", "Blue", "Pink", "Yellow", "Black"]`
# and save the result in a variable called `heroes`.

# ```rb
# Your answer here
rangers = ["Red", "Blue", "Pink", "Yellow", "Black"]
heroes = planeteers + rangers
# => ["Earth",
#     "Wind",
#     "Captain Planet",
#     "Fire",
#     "Water",
#     "Red",
#     "Blue",
#     "Pink",
#     "Yellow",
#     "Black"]
# ```

# Alphabetize the contents of `heroes` using a method.
# [The Ruby documentation might help](http://ruby-doc.org/core-2.2.0/Array.html).

# ```rb
# Your answer here
heroes.sort
# => ["Black",
#     "Blue",
#     "Captain Planet",
#     "Earth",
#     "Fire",
#     "Pink",
#     "Red",
#     "Water",
#     "Wind",
#     "Yellow"]
# ```

# Randomize the contents of `heroes` using a method.
# [The Ruby documentation might help](http://ruby-doc.org/core-2.2.0/Array.html).

# ```rb
# Your answer here
heroes.shuffle
# => ["Yellow",
#     "Captain Planet",
#     "Water",
#     "Wind",
#     "Earth",
#     "Blue",
#     "Red",
#     "Fire",
#     "Black",
#     "Pink"]
# ```

# #### Bonus

# Select a random element from `heroes` using a method. [
# The Ruby documentation might help](http://ruby-doc.org/core-2.2.0/Array.html).

# ```rb
# Your answer here
heroes.sample # => "Captain Planet"
# ```

# Select all elements in `heroes` that begin with "B" using a method.
# [The Ruby documentation might help](http://ruby-doc.org/core-2.2.0/Array.html).

# ```rb
# Your answer here
heroes.find_all { |hero| hero.start_with?("B") } # => ["Blue", "Black"]
heroes.select { |hero| hero.start_with?("B") } # => ["Blue", "Black"]
# ```

# ### Hashes

# Initialize a hash called `ninja_turtle` with the properties `name`, `weapon` and
#  `radical`. They should have values of "Michelangelo", "Nunchuks" and `true`
#  respectively.

# ```rb
# Your answer here
ninja_turtle = {
  name: "Michelangelo",
  weapon: "Nunchuks",
  radical: true
}
# ```

# Add a key `age` to `ninja_turtle`. Set it to whatever numerical value you'd
# like.

# ```rb
# Your answer here
ninja_turtle[:age] = 18
ninja_turtle
# => {:name=>"Michelangelo", :weapon=>"Nunchuks", :radical=>true, :age=>18}
# ```

# Remove the `radical` key-value pair from `ninja_turtle`.

# ```rb
# Your answer here
ninja_turtle.delete(:radical) # => true
ninja_turtle
# => {:name=>"Michelangelo", :weapon=>"Nunchuks", :age=>18}
# ```

# Add a key `pizza_toppings` to `ninja_turtle`. Set it to an array of strings
# (e.g., `["cheese", "pepperoni", "peppers"]`).

# ```rb
# Your answer here
ninja_turtle[:pizza_toppings] = ["cheese", "pepperoni", "peppers"]
ninja_turtle
# => {:name=>"Michelangelo",
#     :weapon=>"Nunchuks",
#     :age=>18,
#     :pizza_toppings=>["cheese", "pepperoni", "peppers"]}
# ```

# Access the first element of `pizza_toppings`.

# ```rb
# Your answer here
ninja_turtle[:pizza_toppings][0] # => "cheese"
ninja_turtle[:pizza_toppings].first # => "cheese"
# ```

# Produce an array containing all of `ninja_turtle`'s keys using a method.
# [The Ruby documentation might help](http://ruby-doc.org/core-1.9.3/Hash.html).

# ```rb
# Your answer here
ninja_turtle.keys # => [:name, :weapon, :age, :pizza_toppings]
# ```

# #### Bonus

# Print out each key-value pair in the following format - "KEY's is equal to
# VALUE" -- using a method.
# [The Ruby documentation might help](http://ruby-doc.org/core-1.9.3/Hash.html).

# ```rb
# Your answer here
ninja_turtle.each do |key, value|
  puts "#{key}'s is equal to #{value}"
end
# ```
# >> name's is equal to Michelangelo
# >> weapon's is equal to Nunchuks
# >> age's is equal to 18
# >> pizza_toppings's is equal to ["cheese", "pepperoni", "peppers"]
