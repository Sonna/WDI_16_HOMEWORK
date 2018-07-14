# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

$LOAD_PATH.push File.expand_path('../', __FILE__)

# require_relative 'animal'
# require_relative 'client'
# require_relative 'shelter'
require 'animal'
require 'client'
require 'shelter'

# # HappiTails

# ### Objectives:

# - Practice creating objects

# - You are the manager at HappiTails animal shelter. You need to manage your
#   shelter by storing and manipulating information about clients and animals.

# ### Specification:
# ##### Object Specs:

# - Relationships:
#   - A client should be able to adopt an animal.
#   - A client should be able to put an animal up for adoption

class Relationships
  attr_reader :animal, :client

  def initialize(animal, client)
    @animal = animal
    @client = client
  end
end

# ##### Phase 1

# - Can create animals and clients

robin = Client.new('Christopher Robin', 9) # => #<Client:0x00007fadc7053378 @name="Christopher Robin", @age=9, @num_children=0, @pets=[]>
aa_milne = Client.new('Alan Alexander Milne', 30, 1)
# => #<Client:0x00007fadc78579c0
#     @age=30,
#     @name="Alan Alexander Milne",
#     @num_children=1,
#     @pets=[]>

pooh = Animal.new('winnie', 2, 'male', 'stuffed bear', 'honey', 'red shirt')
# => #<Animal:0x00007fadc785fdc8
#     @age=2,
#     @gender="male",
#     @name="winnie",
#     @species="stuffed bear",
#     @toys=["honey", "red shirt"]>

tigger = Animal.new('tigger', 4, 'male', 'stuffed tiger', 'A bouncing ball', 'A jumping jack', 'A jumping Jill', 'A rocket ship', 'A couple dozen banana splits', 'A Pogo stick', 'A trampoline', 'A flying machine', 'A banana split', 'A Pogo stick ', 'Book on "Tigers bounce best"')
# => #<Animal:0x00007fadc783e808
#     @age=4,
#     @gender="male",
#     @name="tigger",
#     @species="stuffed tiger",
#     @toys=
#      ["A bouncing ball",
#       "A jumping jack",
#       "A jumping Jill",
#       "A rocket ship",
#       "A couple dozen banana splits",
#       "A Pogo stick",
#       "A trampoline",
#       "A flying machine",
#       "A banana split",
#       "A Pogo stick ",
#       "Book on \"Tigers bounce best\""]>

kanga = Animal.new('kanga', 1, 'female', 'kangaroo') # => #<Animal:0x00007fadc7847f70 @name="kanga", @age=1, @gender="female", @species="kangaroo", @toys=[]>
roo = Animal.new('roo', 1, 'male', 'kangaroo') # => #<Animal:0x00007fadc78458d8 @name="roo", @age=1, @gender="male", @species="kangaroo", @toys=[]>
eyore = Animal.new('eyore', 1, 'male', 'donkey') # => #<Animal:0x00007fadc7844d70 @name="eyore", @age=1, @gender="male", @species="donkey", @toys=[]>
piglet = Animal.new('piglet', 1, 'male', 'pig') # => #<Animal:0x00007fadc7844208 @name="piglet", @age=1, @gender="male", @species="pig", @toys=[]>
rabbit = Animal.new('rabbit', 1, 'female', 'rabbit', 'carrots') # => #<Animal:0x00007fadc782b370 @name="rabbit", @age=1, @gender="female", @species="rabbit", @toys=["carrots"]>
gopher = Animal.new('gopher', 1, 'male', 'gopher') # => #<Animal:0x00007fadc782a768 @name="gopher", @age=1, @gender="male", @species="gopher", @toys=[]>
owl = Animal.new('owl', 1, 'male', 'owl') # => #<Animal:0x00007fadc7829cc8 @name="owl", @age=1, @gender="male", @species="owl", @toys=[]>
lumpy = Animal.new('lumpy', 1, 'male', 'heffalump') # => #<Animal:0x00007fadc7828e18 @name="lumpy", @age=1, @gender="male", @species="heffalump", @toys=[]>

# ##### Phase 2

# - New animals and clients can be added to the shelter
hundred_acre_woods = Shelter.new(
  [robin, aa_milne],
  [pooh, tigger, kanga, roo, eyore, piglet, rabbit, gopher, owl, lumpy]
)

class Shelter
  def add_client(client)
    @clients.push(client)
  end

  def add_animal(animal)
    @animals.push(animal)
  end
end

# ##### Phase 3

# - When creating an animal or client, the user is prompted for information like
#   names, gender etc.

animals = []
clients = []

loop do
  print "Add Animal or Client? (1 => animal, 2 => client)"
  choice = gets.chomp

  case choice.downcase
  when "1", "animal"
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
  when "2", "client"
    print "A name for the new Client?"
    name = gets.chomp

    print "Their age?"
    age = gets.chomp.to_i

    print "Their gender?"
    gender = gets.chomp

    print "Number of children?"
    num_children = gets.chomp.to_i

    pets = []
    loop do
      print "Name of a pet? (leave blank to stop adding pets)"
      break if (pet = gets.chomp).empty?
      pets.push(pet)
    end
    clients << Client.new(name, age, gender, num_children, *pets)
  else
    puts "Unkown choice"
  end

  print "Add another Animal or Client? (y/n)"
  break unless (gets.chomp == "y")
end

# ##### Phase 4

# - At start, the user is prompted with a menu of options:
#     - display all animals
#     - display all clients
#     - create an animal
#     - create an client
#     - facilitate client adopts an animal
#     - facilitate client puts an animal up for adoption

# - After selecting from the menu the task the user is prompted through the
#   entire process

class Shelter
  def display_all_animals
    animals
  end

  def display_all_clients
    clients
  end

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

# require 'pry'
# binding.pry
shelter = hundred_acre_woods
# shelter = Shelter.new(
#   [robin, aa_milne],
#   [pooh, tigger, kanga, roo, eyore, piglet, rabbit, gopher, owl, lumpy]
# )

loop do
  puts <<~MENU
    1) display all animals
    2) display all clients
    3) create an animal
    4) create an client
    5) facilitate client adopts an animal
    6) facilitate client puts an animal up for adoption
    0) quit
  MENU
  choice = gets.chomp

  puts case choice.to_i
    when 0 then break
    when 1 then shelter.display_all_animals
    when 2 then shelter.display_all_clients
    when 3 then shelter.create_an_animal
    when 4 then shelter.create_an_client
    when 5 then shelter.facilitate_client_adopts_an_animal
    when 6 then shelter.facilitate_client_puts_an_animal_up_for_adoption
    else
      "Unknown input, please try again"
    end
  puts "\n" # newline space between ouput & menu
end
