$LOAD_PATH.push File.expand_path('../', __FILE__)

require "animal"
require "client"
require "shelter"

# ##### Phase 2
#
# - New animals and clients can be added to the shelter
module HundredAcreWoods
  class << self
    def build
      Shelter.new(
        [robin, aa_milne],
        [pooh, tigger, kanga, roo, eyore, piglet, rabbit, gopher, owl, lumpy]
      )
    end

    # ## Clients
    def robin
      Client.new('Christopher Robin', 9)
    end
    # => #<Client:0x00007fadc7053378 @name="Christopher Robin", @age=9, @num_children=0, @pets=[]>

    def aa_milne
      Client.new('Alan Alexander Milne', 30, 1)
    end
    # => #<Client:0x00007fadc78579c0
    #     @age=30,
    #     @name="Alan Alexander Milne",
    #     @num_children=1,
    #     @pets=[]>

    # ## Animals
    def pooh
      Animal.new('winnie', 3, 'male', 'pooh bear', 'honey', 'red shirt')
    end
    # => #<Animal:0x00007fadc785fdc8
    #     @age=2,
    #     @gender="male",
    #     @name="winnie",
    #     @species="stuffed bear",
    #     @toys=["honey", "red shirt"]>

    def tigger
      Animal.new('tigger', 4, 'male', 'stuffed tiger', 'A bouncing ball', 'A jumping jack', 'A jumping Jill', 'A rocket ship', 'A couple dozen banana splits', 'A Pogo stick', 'A trampoline', 'A flying machine', 'A banana split', 'A Pogo stick', 'Book on "Tigers bounce best"')
    end
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

    def kanga
      Animal.new('kanga', 17, 'female', 'kangaroo')
    end
    # => #<Animal:0x00007fadc7847f70 @name="kanga", @age=1, @gender="female", @species="kangaroo", @toys=[]>

    def roo
      Animal.new('roo', 1, 'male', 'kangaroo')
    end
    # => #<Animal:0x00007fadc78458d8 @name="roo", @age=1, @gender="male", @species="kangaroo", @toys=[]>

    def eyore
      Animal.new('eyore', 20, 'male', 'donkey')
    end
    # => #<Animal:0x00007fadc7844d70 @name="eyore", @age=1, @gender="male", @species="donkey", @toys=[]>

    def piglet
      Animal.new('piglet', 3, 'male', 'pig')
    end
    # => #<Animal:0x00007fadc7844208 @name="piglet", @age=1, @gender="male", @species="pig", @toys=[]>

    def rabbit
      Animal.new('rabbit', 6, 'female', 'rabbit', 'carrots')
    end
    # => #<Animal:0x00007fadc782b370 @name="rabbit", @age=1, @gender="female", @species="rabbit", @toys=["carrots"]>

    def gopher
      Animal.new('gopher', 12, 'male', 'gopher')
    end
    # => #<Animal:0x00007fadc782a768 @name="gopher", @age=1, @gender="male", @species="gopher", @toys=[]>

    def owl
      Animal.new('owl', 31, 'male', 'owl')
    end
    # => #<Animal:0x00007fadc7829cc8 @name="owl", @age=1, @gender="male", @species="owl", @toys=[]>

    def lumpy
      Animal.new('lumpy', 1, 'male', 'heffalump')
    end
    # => #<Animal:0x00007fadc7828e18 @name="lumpy", @age=1, @gender="male", @species="heffalump", @toys=[]>
  end
end
