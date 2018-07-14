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

  # ##### Phase 2
  #
  # - New animals and clients can be added to the shelter
  def add_client(client)
    clients.push(client)
  end

  def add_animal(animal)
    animals.push(animal)
  end

  # ##### Phase 4
  #
  # - At start, the user is prompted with a menu of options:
  #     - display all animals
  #     - display all clients
  #     - create an animal
  #     - create an client
  #     - facilitate client adopts an animal
  #     - facilitate client puts an animal up for adoption
  #
  # - After selecting from the menu the task the user is prompted through the
  #   entire process
  def display_all_animals
    animals
  end

  def display_all_clients
    clients
  end

  # ##### Phase 3
  #
  # - When creating an animal or client, the user is prompted for information
  #   like names, gender etc.
  def create_an_animal
    loop do
      print "A name for the new Animal?"
      name = gets.chomp

      print "Its age?"
      age = gets.chomp.to_i

      print "Its gender?"
      gender = gets.chomp

      print "Its species?"
      species = gets.chomp

      toys = []
      loop do
        print "Give/add a Toy to the Animal? (leave blank to stop adding toys)"
        break if (toy = gets.chomp).empty?
        toys.push(toy)
      end

      animals << Animal.new(name, age, gender, species, *toys)

      print "Add another Animal? (y/n)"
      break unless (gets.chomp == "y")
    end
  end

  def create_an_client
    loop do
      print "A name for the new Client? "
      name = gets.chomp

      print "Their age? "
      age = gets.chomp.to_i

      print "Their gender? "
      gender = gets.chomp

      print "Number of children? "
      num_children = gets.chomp.to_i

      pets = []
      loop do
        print "Name of a pet? (leave blank to stop adding pets) "
        break if (pet = gets.chomp).empty?
        pets.push(pet)
      end

      clients << Client.new(name, age, gender, num_children, *pets)

      print "Add another Client? (y/n) "
      break unless (gets.chomp == "y")
    end
  end

  def facilitate_client_adopts_an_animal
    puts "The name of Client, adopting an animal?"
    name = gets.chomp
    client = clients.select { |x| x.name == name }

    puts "The name of Animal being adopted by the Client?"
    name = gets.chomp
    client.push(animals.delete_if { |x| x.name == name })
  end

  def facilitate_client_puts_an_animal_up_for_adoption
    puts "A name of Client, putting animal up for adoption?"
    name = gets.chomp
    client = clients.select { |x| x.name == name }

    *head, tail = client.pets
    puts "This Client has the following pets: " \
      "#{head.join(', ') + (head.any? ? ' & ' : '')}#{tail}"

    puts "The name of Animal being put up for adoption?"
    name = gets.chomp
    animal.push(client.pets.delete_if { |x| x.name == name })
  end
end

Shelter.new # => #<Shelter:0x00007fadc6919670 @clients=[], @animals=[]>
