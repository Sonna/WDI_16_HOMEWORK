# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

# ### Specification:
# ##### Object Specs:

# - Shelter:
#   - The shelter should display all the clients.
#   - The shelter should display all the animals.

class Shelter
  attr_reader :clients, :animals

  def initialize(clients = [], animals = [])
    @clients = clients
    @animals = animals
  end
end

Shelter.new # => #<Shelter:0x00007fadc6919670 @clients=[], @animals=[]>
