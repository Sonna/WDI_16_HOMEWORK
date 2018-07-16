# ---
# source:
# - title: week4_ruby_objects_class.md
#   url: https://gist.github.com/epoch/e9bf9c429fbcb2888c87cc7548364c99#file-week4_ruby_objects_class-md
# ---

# $LOAD_PATH.push __dir__
$LOAD_PATH.push File.expand_path('../', __FILE__)

require "monkey"

# # Monkies!!

# ...

# Create another file app.rb to use test out the Monkey class
# you should be able to call all the following methods

# ```ruby
adam = Monkey.new("Adam", "Spider Monkey")
adam.eat('fruit salad')
adam.eat('banana milkshake')
# "Hi my name is Adam. I am a Spider Monkey. I had fruit salad and banana milkshake for brunch"
adam.introduce # => "Nice to meet you, I'm Adam the Spider Monkey, I have been eating fruit salad & banana milkshake"
# ```
