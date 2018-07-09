puts "Hello World!"
2 + 2 # => 4
puts(2 + 2)

# puts 2 + 2)

# > > 4
# ~ > -:4: syntax error, unexpected ')', expecting end-of-input
# ~ > puts 2 + 2)
# ~ >           ^
#

# ```shell
#     $ irb
#     irb(main):001:0> 2 + 2
#     => 4
#     irb(main):002:0> exit
#     $
# ```

# Comments are done with the `#` symbol at the beginngin of the line

# how to run ruby
# ruby intro.rb
puts(2 + 2)

# data types & structures
# booleans numbers strings

[] # array
{} # hash

# ```shell
#     $ irb
#     irb(main):001:0> 2 + 3
#     => 5
#     irb(main):002:0> 'hello'
#     => "hello"
#     irb(main):003:0> wat
#     Traceback (most recent call last):
#             2: from /Users/Sonna/.rbenv/versions/2.5.1/bin/irb:11:in `<main>'
#             1: from (irb):1
#     NameError (undefined local variable or method `wat' for main:Object)
#     Did you mean?  warn
#     irb(main):004:0> true
#     => true
#     irb(main):005:0> false
#     => false
#     irb(main):006:0> []
#     => []
#     irb(main):007:0> ['a', 'b']
#     => ["a", "b"]
#     irb(main):008:0> 2 + 'b'
#     Traceback (most recent call last):
#             3: from /Users/Sonna/.rbenv/versions/2.5.1/bin/irb:11:in `<main>'
#             2: from (irb):2
#             1: from (irb):2:in `+'
#     TypeError (String can't be coerced into Integer)
#     irb(main):009:0> 2 + 2
#     => 4
#     irb(main):010:0> '2' + '2'
#     => "22"
#     irb(main):011:0> [].push('a')
#     => ["a"]
#     irb(main):012:0> ['a'].shift
#     => "a"
# ```

# scopes

# total = 4 # local scope
total = 12 # local scope

# ```shell
#     $ irb
#     irb(main):001:0> person = {}
#     => {}
#     irb(main):002:0> person.name = 'slackers'
#     Traceback (most recent call last):
#             2: from /Users/Sonna/.rbenv/versions/2.5.1/bin/irb:11:in `<main>'
#             1: from (irb):2
#     NoMethodError (undefined method `name=' for {}:Hash)
#     irb(main):003:0> person['name']
#     => nil
#     irb(main):004:0> person['name'] = 'slackers'
#     => "slackers"
#     irb(main):005:0> person
#     => {"name" => "slackers"}
#     irb(main):006:0> person['name']
#     => "slackers"
#     irb(main):007:0> languages = []
#     => []
#     irb(main):008:0> languages
#     => []
#     irb(main):009:0> languages.push("js")
#     => ["js"]
#     irb(main):010:0> languages
#     => ["js"]
#     irb(main):011:0> languages.push("ruby")
#     => ["js", "ruby"]
#     irb(main):012:0> languages
#     => ["js", "ruby"]
#     irb(main):013:0> languages.length
#     => 2
# ```

puts(total)

# flow control

student_count = 18
# student_count = 23

# if (student_count > 20)
if student_count > 20
  puts("management" + " promise me")
  puts("2 TAs")
# end
elsif student_count < 10
  puts("you are on your own")
else
  puts("they already pay me too much")
end

# loops

5.times do
  puts("hello")
  puts("how are you?")
end

count = 0
while count < 5
  puts("hello")
  # count = count + 1
  count += 1
end

languages = ["js", "ruby", "php"]

# loop do
#   puts(languages[0])
# end

# languages.forEach(function(elem) { });
# languages.each do |elem|
languages.each do |language|
  # puts(???)
  # puts(elem)
  puts(language)
end

# >> Hello World!
# >> 4
# >> 4
# >> 12
# >> they already pay me too much
# >> hello
# >> how are you?
# >> hello
# >> how are you?
# >> hello
# >> how are you?
# >> hello
# >> how are you?
# >> hello
# >> how are you?
# >> hello
# >> hello
# >> hello
# >> hello
# >> hello
# >> js
# >> ruby
