# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

$LOAD_PATH.push File.expand_path('../', __FILE__)

# require_relative 'animal'
# require_relative 'client'
# require_relative 'shelter'
# require_relative 'hundred_acre_woods'
require 'animal'
require 'client'
require 'shelter'
require 'hundred_acre_woods'

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

# class Relationships
#   attr_reader :animal, :client

#   def initialize(animal, client)
#     @animal = animal
#     @client = client
#   end
# end

# ##### Phase 1

# - Can create animals and clients

# ##### Phase 2

# - New animals and clients can be added to the shelter
hundred_acre_woods = HundredAcreWoods.build # !> assigned but unused variable - hundred_acre_woods

# ##### Phase 3

# - When creating an animal or client, the user is prompted for information like
#   names, gender etc.

def phase3
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

      print "Number of children?"
      num_children = gets.chomp.to_i

      pets = []
      loop do
        print "Name of a pet? (leave blank to stop adding pets)"
        break if (pet = gets.chomp).empty?
        pets.push(pet)
      end
      clients << Client.new(name, age, num_children, *pets)
    else
      puts "Unkown choice"
    end

    print "Add another Animal or Client? (y/n)"
    break unless (gets.chomp == "y")
  end
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

module Happitails
  def self.cli
    shelter = HundredAcreWoods.build

    loop do
      puts menu_prompt + "\n"
      puts case gets.chomp.to_i
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
  end

  def self.menu_prompt
    <<~MENU
      1) display all animals
      2) display all clients
      3) create an animal
      4) create an client
      5) facilitate client adopts an animal
      6) facilitate client puts an animal up for adoption
      0) quit
    MENU
  end
end

if $PROGRAM_NAME == __FILE__ && ARGV.first == "run"
  # without `clear`, `"run"` is used as filename & `gets` is called from it
  ARGV.clear
  Happitails.cli
elsif $PROGRAM_NAME == __FILE__ ||
  ($PROGRAM_NAME == __FILE__ && ARGV.first == "test")
  require "minitest/autorun"
  require "test_helper"

  class HappiTailsTest < Minitest::Test
    def test_it_works
      assert true
    end

    def test_cli_can_quit
      captured_output = local_io("\n") { described_class.cli }
      assert_equal(<<~EXPECTED, captured_output)
        1) display all animals
        2) display all clients
        3) create an animal
        4) create an client
        5) facilitate client adopts an animal
        6) facilitate client puts an animal up for adoption
        0) quit

      EXPECTED
    end

    def test_cli_can_receive_unknown_command
      captured_output = local_io("9\n\n") { described_class.cli }
      assert_equal(<<~EXPECTED, captured_output)
        #{described_class.menu_prompt}
        Unknown input, please try again

        #{described_class.menu_prompt}
      EXPECTED
    end

    private

    def described_class
      Happitails
    end
  end
end
# >> Run options: --seed 43191
# >>
# >> # Running:
# >>
# >> ...
# >>
# >> Finished in 0.000916s, 3275.1092 runs/s, 3275.1092 assertions/s.
# >> 3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
