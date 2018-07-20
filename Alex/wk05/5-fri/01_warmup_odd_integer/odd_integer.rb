# ---
# source:
# - title: WDI Odd Int Warmup
#   url: https://gist.github.com/kasun-maldeni/919b2d75fe2d41c563c826ff1616bbf7
# ---

# # The Odd Integer Warmup

# You have an array of integers. Find the integer that appears an odd number of
# times.

# There will **always** be only **one** integer that appears an odd number of
# times.

# For Example: `[20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]`, answer is `5` since
# it is the only number that appears an odd number of times.

my_array = [20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]
my_array.group_by(&:itself).select { |k, v| v.size.odd? }.keys
# => [5]

my_array.find { |x| my_array.count(x).odd? }
# => 5
