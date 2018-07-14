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
    "#{name} #{age} #{gender} #{species} #{toys.join(', ')}"
  end
end

Animal.new # => #<Animal:0x00007fadc693f668 @name="", @age=0, @gender="", @species="", @toys=[]>
