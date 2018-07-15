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

  # You should look at the implementation of #== on Array or its members.
  def ==(other)
    self.class == other.class &&
      name == other.name &&
      age == other.age &&
      num_children == other.num_children &&
      pets == other.pets
  end

  def to_s
    return if [name, pets].all?(&:empty?) && [age, num_children].all?(&:zero?)
    "#{name} (age #{age}, with #{num_children} kids). Pets: #{pets.join(', ')}"
  end

  # - Relationships:
  #   - A client should be able to adopt an animal.
  def adopt(animal)
    pets.push(animal) if animal
  end

  # - Relationships:
  #   - A client should be able to put an animal up for adoption
  def abandon(animal)
    pets.delete(animal) if animal
  end
end

# Client.new # => #<Client:0x00007fadc693e010 @name="", @age=0, @num_children=0, @pets=[]>
if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class ClientTest < Minitest::Test
    def test_its_constructor_works
      assert described_class.new
    end

    def test_name
      subject = described_class.new("Alan Alexander Milne")
      assert_equal("Alan Alexander Milne", subject.name)
    end

    def test_age
      subject = described_class.new("Alan Alexander Milne", 30)
      assert_equal(30, subject.age)
    end

    def test_num_children
      subject = described_class.new("Alan Alexander Milne", 30, 1)
      assert_equal(1, subject.num_children)
    end

    def test_pets
      subject = described_class.new("Alan Alexander Milne", 30, 1, "tiger")
      assert_equal(["tiger"], subject.pets)
    end

    def test_multiple_pets
      subject = described_class.new("Alan Alexander Milne", 30, 1, "plush tiger", "teddy bear")
      assert_equal(["plush tiger", "teddy bear"], subject.pets)
    end

    def test_pets_empty
      subject = described_class.new
      assert_equal([], subject.pets)
    end

    def test_to_s
      subject = described_class.new("Alan Alexander Milne", 30, 1, "plush tiger", "teddy bear")
      assert_equal("Alan Alexander Milne (age 30, with 1 kids). Pets: plush tiger, teddy bear", subject.to_s)
    end

    def test_to_s_when_blank
      subject = described_class.new
      assert_equal("", "#{subject.to_s}")
    end

    def test_adopt
      animal = "tiger"
      subject = described_class.new("Alan Alexander Milne", 30, 1)
      assert_equal [], subject.pets
      subject.adopt(animal)
      assert_equal ["tiger"], subject.pets
    end

    def test_adandon
      animal = "tiger"
      subject = described_class.new("Alan Alexander Milne", 30, 1, animal, "winnie")
      assert_equal ["tiger", "winnie"], subject.pets
      subject.abandon(animal)
      assert_equal ["winnie"], subject.pets
    end

    private

    def described_class
      Client
    end
  end
end
# >> Run options: --seed 33059
# >>
# >> # Running:
# >>
# >> ...........
# >>
# >> Finished in 0.001115s, 9865.4720 runs/s, 11659.1941 assertions/s.
# >> 11 runs, 13 assertions, 0 failures, 0 errors, 0 skips
