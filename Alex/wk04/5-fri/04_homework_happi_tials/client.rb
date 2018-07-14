# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

# - Client:
#   - A client should have a name.
#   - A client should have a number of children.
#   - A client should have an age.
#   - A client should have a list of pets.

# ##### Phase 1

# - Can create animals and clients
class Client
  attr_reader :name, :num_children, :age, :pets

  # def initialize(name = '', age = 0, children = [], pets = [])
  def initialize(name = '', age = 0, num_children = 0, *pets)
    @name = name
    @age = age
    @num_children = num_children
    @pets = pets
  end
end

Client.new # => #<Client:0x00007fadc693e010 @name="", @age=0, @num_children=0, @pets=[]>
