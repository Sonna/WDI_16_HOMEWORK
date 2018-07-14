# ---
# source:
# - title: happitials.md
#   url: https://gist.github.com/epoch/69ce72204a35f72da045
# ---

# ### Specification:
# ##### Object Specs:
# - Animal:
#   - An animal should have a name.
#   - An animal should have an age.
#   - An animal should have a gender.
#   - An animal should have a species.
#   - An animal can have multiple toys.

# ##### Phase 1

# - Can create animals and clients
class Animal
  attr_reader :name, :age, :gender, :species, :toys

  def initialize(name = '', age = 0, gender = '', species = '', *toys)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = toys
  end

  def to_s
    return "" if [name, gender, species, toys].all?(&:empty?) && age.zero?
    "#{name} (#{age} year old #{gender} #{species}). Toys: #{toys.join(', ')}"
  end
end

# Animal.new # => #<Animal:0x00007fadc693f668 @name="", @age=0, @gender="", @species="", @toys=[]>
if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class AnimalTest < Minitest::Test
    def test_its_constructor_works
      assert described_class.new
    end

    def test_name
      subject = described_class.new("Tigger")
      assert_equal("Tigger", subject.name)
    end

    def test_age
      subject = described_class.new("Tigger", 4)
      assert_equal(4, subject.age)
    end

    def test_gender
      subject = described_class.new("Tigger", 4, "male")
      assert_equal("male", subject.gender)
    end

    def test_species
      subject = described_class.new("Tigger", 4, "male", "plush tiger")
      assert_equal("plush tiger", subject.species)
    end

    def test_toys
      subject = described_class.new("Tigger", 4, "male", "plush tiger", "A Pogo stick")
      assert_equal(["A Pogo stick"], subject.toys)
    end

    def test_multiple_toys
      subject = described_class.new("Tigger", 4, "male", "plush tiger", "A bouncing ball", "A jumping jack", "A jumping Jill")
      assert_equal(["A bouncing ball", "A jumping jack", "A jumping Jill"], subject.toys)
    end

    def test_toys_empty
      subject = described_class.new
      assert_equal([], subject.toys)
    end

    def test_to_s
      subject = described_class.new("Tigger", 4, "male", "plush tiger", "A bouncing ball", "A jumping jack", "A jumping Jill")
      assert_equal("Tigger (4 year old male plush tiger). Toys: A bouncing ball, A jumping jack, A jumping Jill", subject.to_s)
    end

    def test_to_s_when_blank
      subject = described_class.new
      assert_equal("", subject.to_s)
    end

    private

    def described_class
      Animal
    end
  end
end
# >> Run options: --seed 59607
# >>
# >> # Running:
# >>
# >> ..........
# >>
# >> Finished in 0.001330s, 7518.7950 runs/s, 7518.7950 assertions/s.
# >> 10 runs, 10 assertions, 0 failures, 0 errors, 0 skips
