print "enter filename: "
filename = gets.chomp

# read filename

# puts File.new(filename).readlines.length
# puts File.readlines(filename).length
puts IO.readlines(filename).length

# work out how many lines

# print in terminal
