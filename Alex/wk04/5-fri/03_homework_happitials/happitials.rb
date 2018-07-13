# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

# # HappiTails

# ### Objectives:

# - Practice creating objects

# - You are the manager at HappiTails animal shelter. You need to manage your
#   shelter by storing and manipulating information about clients and animals.

# ### Specification:
# ##### Object Specs:
# - Animal:
#   - An animal should have a name.
#   - An animal should have an age.
#   - An animal should have a gender.
#   - An animal should have a species.
#   - An animal can have multiple toys.

class Animal
  attr_reader :name, :age, :gender, :species, :toys

  def initialize(name = '', age = 0, gender = '', species = '', *toys)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = toys
  end
end

Animal.new # => #<Animal:0x00007f8b4f05d8e0 @name="", @age=0, @gender="", @species="", @toys=[]>

# - Client:
#   - A client should have a name.
#   - A client should have a number of children.
#   - A client should have an age.
#   - A client should have a list of pets.

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

Client.new # => #<Client:0x00007f8b4f03f480 @name="", @age=0, @children=[], @pets=[]>

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

Shelter.new # => #<Shelter:0x00007f8b4f03d540 @clients=[], @animals=[]>

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

robin = Client.new('Christopher Robin', 9) # => #<Client:0x00007f8b4f03c208 @name="Christopher Robin", @age=9, @children=[], @pets=[]>
aa_milne = Client.new('Alan Alexander Milne', 30, 1)
# => #<Client:0x00007f8b500b5558
#     @age=30,
#     @children=
#      [#<Client:0x00007f8b4f03c208
#        @age=9,
#        @children=[],
#        @name="Christopher Robin",
#        @pets=[]>],
#     @name="Alan Alexander Milne",
#     @pets=[]>

pooh = Animal.new('winnie', 2, 'male', 'stuffed bear', 'honey', 'red shirt')
# => #<Animal:0x00007f8b50073360
#     @age=2,
#     @gender="male",
#     @name="winnie",
#     @species="stuffed bear",
#     @toys=["honey", "red shirt"]>

tigger = Animal.new('tigger', 4, 'male', 'stuffed tiger', 'A bouncing ball', 'A jumping jack', 'A jumping Jill', 'A rocket ship', 'A couple dozen banana splits', 'A Pogo stick', 'A trampoline', 'A flying machine', 'A banana split', 'A Pogo stick ', 'Book on "Tigers bounce best"')
# => #<Animal:0x00007f8b500a7318
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

kanga = Animal.new('kanga', 1, 'female', 'kangaroo') # => #<Animal:0x00007f8b5006d190 @name="kanga", @age=1, @gender="female", @species="kangaroo", @toys=[]>
roo = Animal.new('roo', 1, 'male', 'kangaroo') # => #<Animal:0x00007f8b5006c740 @name="roo", @age=1, @gender="male", @species="kangaroo", @toys=[]>
eyore = Animal.new('eyore', 1, 'male', 'donkey') # => #<Animal:0x00007f8b5006b4a8 @name="eyore", @age=1, @gender="male", @species="donkey", @toys=[]>
piglet = Animal.new('piglet', 1, 'male', 'pig') # => #<Animal:0x00007f8b5006a490 @name="piglet", @age=1, @gender="male", @species="pig", @toys=[]>
rabbit = Animal.new('rabbit', 1, 'female', 'rabbit', 'carrots') # => #<Animal:0x00007f8b50068230 @name="rabbit", @age=1, @gender="female", @species="rabbit", @toys=["carrots"]>
gopher = Animal.new('gopher', 1, 'male', 'gopher') # => #<Animal:0x00007f8b50065e40 @name="gopher", @age=1, @gender="male", @species="gopher", @toys=[]>
owl = Animal.new('owl', 1, 'male', 'owl') # => #<Animal:0x00007f8b50065210 @name="owl", @age=1, @gender="male", @species="owl", @toys=[]>
lumpy = Animal.new('lumpy', 1, 'male', 'heffalump') # => #<Animal:0x00007f8b500646d0 @name="lumpy", @age=1, @gender="male", @species="heffalump", @toys=[]>

# ##### Phase 2

# - New animals and clients can be added to the shelter
hundred_acre_woods = Shelter.new(
  [robin, aa_milne],
  [pooh, tigger, kanga, roo, eyore, piglet, rabbit, gopher, owl, lumpy]
)

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
    age = gets.chomp

    print "Its gender?"
    gender = gets.chomp

    print "Its species?"
    species = gets.chomp

    toys = []
    loop do
      print "Give/add a Toy to the Animal? (leave blank to stop adding toys)"
      break if (toy = gets.chomp)
      toys.push(toy)
    end

  when "2", "client"
  else
    puts "Unkown choice"
  end

  print "Add another Animal or Client? (y/n)"
  break if (gets.chomp == "y")
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
