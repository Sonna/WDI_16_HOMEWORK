# ---
# source:
# - title: week4_ruby_objects_class.md
#   url: https://gist.github.com/epoch/e9bf9c429fbcb2888c87cc7548364c99#file-week4_ruby_objects_class-md
# ---

# # Monkies!!

# Create a `Monkey` class in `monkey.rb`, which has the following attributes:
# * `name` - a string, which should be determined by some input
# * `species` - a string, which should be determined by some input
# * `foods_eaten` - an array, which should be initialized as an empty array

# And the following methods:
# * `eat(food)` - adds a food (a string) to the list of foods eaten
# * `introduce` - introduces self, with name, species, and what it's eaten

class Monkey
  attr_reader :name, :species, :foods_eaten

  def initialize(name, species, *foods_eaten)
    @name = name
    @species = species
    @foods_eaten = foods_eaten
  end

  def eat(food)
    @foods_eaten.push(food)
  end

  def introduce
    "Nice to meet you, I'm #{name} the #{species}, I have been eating #{foods_eaten.join(', ')}"
  end
end
