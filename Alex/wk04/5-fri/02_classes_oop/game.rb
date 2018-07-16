# super mario

# $LOAD_PATH.push File.expand_path("/Users/Sonna/Projects/all/wdi/Alex/wk04/5-fri/02_classes_oop/", __dir__)
$LOAD_PATH.push File.expand_path('../', __FILE__)

# require_relative 'mario'
# require_relative 'yoshi'
require 'mario'
require 'yoshi'

# $size = 'small'


# class Mario # factory or blueprint for making marios

#   def initialize # special method thats runs when you make a new mario
#     # size = 'small'
#     @size = 'small' # instance variable value lives as long as the instance lives

#     puts "made new mario"
#   end

#   def jump()
#     puts "jumping"
#   end

#   def eat(food)
#     if food == "mushroom"
#       @size = "big"
#     end
#   end

# end

# require "pry"
# binding.pry

=begin
# interface for programmers
mario = Mario.new()
mario.jump() # methods
mario.duck()
mario.eat('mushroom')
mario.eat('mushroom')

=end

m1 = Mario.new()
m1.class # => Mario
m2 = Mario.new()
m2.class # => Mario

m1.jump
arr = [] # => []
arr = Array.new() # => []
hash = Hash.new() # => {}
{} # => {}

mario = Mario.new # => #<Mario:0x00007fe90c13e2d0 @size="small">
abc = 'hello' # => "hello"
size = 'baby' # => "baby"

# `m1` has size 'small', everytime you inspect it
m1 # => #<Mario:0x00007fe90c147ba0 @size="small">
m1 # => #<Mario:0x00007fe90c147ba0 @size="small">
m1.eat('mushroom')
m1 # => #<Mario:0x00007fe90c147ba0 @size="big">
m1 # => #<Mario:0x00007fe90c147ba0 @size="big">
# `m1` size has changed to 'big', and stays 'big' everytime you inspect it after
# eating a 'mushroom'

# `m2` is still 'small'
m2 # => #<Mario:0x00007fe90c146868 @size="small">

#

# class Yoshi # blueprint
#   # def initialize()
#   #  @colour = 'green'
#   # def initialize(color)
#   #   @colour = color
#   def initialize(new_color = 'green')
#     @colour = new_color
#   end
# end

y1 = Yoshi.new # => #<Yoshi:0x00007fe90c11b028 @colour="green">
# old error message, when no default argument
# ~ > -:74:in `initialize': wrong number of arguments (given 0, expected 1) (ArgumentError)
# ~ >  from -:79:in `new'
# ~ >  from -:79:in `<main>'

y2 = Yoshi.new('red') # => #<Yoshi:0x00007fe90c119d40 @colour="red">
y3 = Yoshi.new() # => #<Yoshi:0x00007fe90c117d60 @colour="green">

mario = Mario.new
red_yoshi = Yoshi.new('red')

mario.jump
red_yoshi.jump

# >> made new mario
# >> made new mario
# >> jumping
# >> made new mario
# >> made new mario
# >> jumping
# >> jumps
