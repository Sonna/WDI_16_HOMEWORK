# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

$LOAD_PATH.push File.expand_path('../', __FILE__)

require "animal"
require "client"

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
  def create_an_animal(shelter_or_client = animals)
    loop do
      print "A name for the new Animal? "
      name = gets.chomp

      print "Its age? "
      age = gets.chomp.to_i

      print "Its gender? "
      gender = gets.chomp

      print "Its species? "
      species = gets.chomp

      toys = []
      loop do
        print "Give/add a Toy to the Animal? (leave blank to stop adding toys) "
        break if (toy = gets.chomp).empty?
        toys.push(toy)
      end

      shelter_or_client << Animal.new(name, age, gender, species, *toys)

      print "Add another Animal? (y/n) "
      break unless (gets.chomp == "y")
    end
  end

  def create_an_client
    loop do
      print "A name for the new Client? "
      name = gets.chomp

      print "Their age? "
      age = gets.chomp.to_i

      print "Number of children? "
      num_children = gets.chomp.to_i

      pets = []
      print "Have any pets? (y/n) "
      if (gets.chomp == "y")
        create_an_animal(pets)
        # pets.push(pet)
      end

      clients << Client.new(name, age, num_children, *pets)

      print "Add another Client? (y/n) "
      break unless (gets.chomp == "y")
    end
  end

  def facilitate_client_adopts_an_animal
    puts "The name of Client, adopting an animal?"
    client_name = gets.chomp
    client = clients.find(&by_name(client_name))

    puts "The name of Animal being adopted by the Client?"
    pet_name = gets.chomp
    # client.pets.push(animals.delete_if { |x| x.name == pet_name })
    pet_idx = animals.find_index(&by_name(pet_name))
    pet = animals.delete_at(pet_idx)
    client.adopt(pet)
  end

  def facilitate_client_puts_an_animal_up_for_adoption
    puts "A name of Client, putting animal up for adoption?"
    client_name = gets.chomp
    client = clients.find(&by_name(client_name))

    *head, tail = client.pets
    puts "This Client has the following pets: " \
      "#{head.join(', ') + (head.any? ? ' & ' : '')}#{tail}"

    puts "The name of Animal being put up for adoption?"
    pet_name = gets.chomp
    pet = client.pets.find(&by_name(pet_name))
    animals.push(client.abandon(pet))
  end

  private

  def by_name(name)
    ->(x) { x.name == name }
  end
end

# Shelter.new # => #<Shelter:0x00007fadc6919670 @clients=[], @animals=[]>
if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"
  require "test_helper"

  class ShelterTest < Minitest::Test
    def test_its_constructor_works
      assert described_class.new
    end

    def test_for_animals_collection
      assert_equal [], described_class.new.animals
    end

    def test_for_clients_collection
      assert_equal [], described_class.new.clients
    end

    def test_add_animal
      subject = described_class.new [], ["tiger", "bear"]
      assert_equal subject.animals, ["tiger", "bear"]
      subject.add_animal("rabbit")
      assert_equal subject.animals, ["tiger", "bear", "rabbit"]
    end

    def test_add_client
      subject = described_class.new ["Christopher"]
      assert_equal subject.clients, ["Christopher"]
      subject.add_client("Robin")
      assert_equal subject.clients, ["Christopher", "Robin"]
    end

    def test_display_all_animals
      subject = described_class.new [], ["tiger", "bear", "rabbit"]
      assert_equal subject.display_all_animals, ["tiger", "bear", "rabbit"]
    end

    def test_display_all_clients
      subject = described_class.new ["Robin", "Christopher"]
      assert_equal subject.display_all_clients, ["Robin", "Christopher"]
    end

    def test_create_an_animal
      subject = described_class.new
      assert_equal [], subject.animals
      captured_ouptut = local_io(<<~USER_INPUT) { subject.create_an_animal }
        Tigger
        4
        male
        plush tiger
        A Pogo Stick

        n
      USER_INPUT

      assert_equal [
        Animal.new("Tigger", 4, "male", "plush tiger", "A Pogo Stick")
      ], subject.animals
      assert_equal(<<~EXPECTED_OUTPUT.gsub(/\n/, " "), captured_ouptut)
        A name for the new Animal?
        Its age?
        Its gender?
        Its species?
        Give/add a Toy to the Animal? (leave blank to stop adding toys)
        Give/add a Toy to the Animal? (leave blank to stop adding toys)
        Add another Animal? (y/n)
      EXPECTED_OUTPUT
    end

    def test_create_an_client
      subject = described_class.new
      assert_equal [], subject.clients
      captured_ouptut = local_io(<<~USER_INPUT) { subject.create_an_client }
        Alan Alexander Milne
        30
        1

        n
      USER_INPUT

      assert_equal [
        Client.new("Alan Alexander Milne", 30, 1)
      ], subject.clients
      assert_equal(<<~EXPECTED_OUTPUT.gsub(/\n/, " "), captured_ouptut)
        A name for the new Client?
        Their age?
        Number of children?
        Have any pets? (y/n)
        Add another Client? (y/n)
      EXPECTED_OUTPUT
    end

    def test_facilitate_client_adopts_an_animal
      robin = Client.new("Christopher Robin", 9)
      winnie = Animal.new("Winnie", 3, "male", "Pooh Bear")
      subject = described_class.new([robin], [winnie])

      assert_equal [robin], subject.clients
      assert_equal [], robin.pets
      assert_equal [winnie], subject.animals

      captured_ouptut = local_io(<<~USER_INPUT) { subject.facilitate_client_adopts_an_animal }
        Christopher Robin
        Winnie
      USER_INPUT

      assert_equal [robin], subject.clients
      assert_equal [winnie], robin.pets
      assert_equal [], subject.animals

      assert_equal(<<~EXPECTED_OUTPUT, captured_ouptut)
        The name of Client, adopting an animal?
        The name of Animal being adopted by the Client?
      EXPECTED_OUTPUT
    end

    def test_facilitate_client_puts_an_animal_up_for_adoption
      winnie = Animal.new("Winnie", 3, "male", "Pooh Bear", "red shirt")
      robin = Client.new("Christopher Robin", 9, 0, winnie)
      subject = described_class.new([robin], [])

      assert_equal [robin], subject.clients
      assert_equal [winnie], robin.pets
      assert_equal [], subject.animals

      captured_ouptut = local_io(<<~USER_INPUT) { subject.facilitate_client_puts_an_animal_up_for_adoption }
        Christopher Robin
        Winnie
      USER_INPUT

      assert_equal [robin], subject.clients
      assert_equal [], robin.pets
      assert_equal [winnie], subject.animals

      assert_equal(<<~EXPECTED_OUTPUT, captured_ouptut)
        A name of Client, putting animal up for adoption?
        This Client has the following pets: Winnie (3 year old male Pooh Bear). Toys: red shirt
        The name of Animal being put up for adoption?
      EXPECTED_OUTPUT
    end

    private

    def described_class
      Shelter
    end
  end
end
# >> Run options: --seed 43898
# >>
# >> # Running:
# >>
# >> ...........
# >>
# >> Finished in 0.001525s, 7213.1138 runs/s, 19016.3909 assertions/s.
# >> 11 runs, 29 assertions, 0 failures, 0 errors, 0 skips
