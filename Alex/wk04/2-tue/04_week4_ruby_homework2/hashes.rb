# ---
# source:
# - title: hashes.md
#   url: https://gist.github.com/epoch/d5940ff7ace0d2f485cb
# ---

# # Array and Hash access

# ### A. Given the following data structure:

# ```ruby
a = ["Anil", "Erik", "Jonathan"]
# ```

# 1. How would you return the string `"Erik"`?
a[1] # => "Erik"

# 2. How would you add your name to the array?

# ignore `dup` its to reset the `a` variable between
b = a.dup
a.push("Alex") # => ["Anil", "Erik", "Jonathan", "Alex"]

a = b.dup
a << "Alex" # => ["Anil", "Erik", "Jonathan", "Alex"]

a = b.dup
a + ["Alex"] # => ["Anil", "Erik", "Jonathan", "Alex"]

a = b.dup
a.concat(["Alex"]) # => ["Anil", "Erik", "Jonathan", "Alex"]

# ### B. Given the following data structure:

# ```ruby
h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# ```

# 1. How would you return the string `"One"`?
h[1] # => "One"

# 2. How would you return the string `"Two"`?
h[:two] # => "Two"

# 3. How would you return the number `2`?
h["two"] # => 2

# 4. How would you add `{3 => "Three"}` to the hash?
h[3] = "Three" # => "Three"
h # => {0=>"Zero", 1=>"One", :two=>"Two", "two"=>2, 3=>"Three"}

# 5. How would you add `{:four => 4}` to the hash?
h[:four] = 4 # => 4
h # => {0=>"Zero", 1=>"One", :two=>"Two", "two"=>2, 3=>"Three", :four=>4}

# ### C. Given the following data structure:

# ```ruby
is = {true => "It's true!", false => "It's false"}
# ```

# 1. What is the return value of `is[2 + 2 == 4]`?
is[2 + 2 == 4] # => "It's true!"

# 2. What is the return value of `is["Erik" == "Jonathan"]`?
is["Erik" == "Jonathan"] # => "It's false"

# 3. What is the return value of `is[9 > 10]`?
is[9 > 10] # => "It's false"

# 4. What is the return value of `is[0]`?
is[0] # => nil

# 5. What is the return value of `is["Erik"]`?
is["Erik"] # => nil


# ### D. Given the following data structure:

# ```ruby
users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Anil" => {
    :twitter => "bridgpal",
    :favorite_numbers => [12, 14, 85],
  },
}
# ```

# 1. How would you access Jonathan's Twitter handle (i.e. the string
#    `"tronathan"`)?
users["Jonathan"][:twitter] # => "tronathan"

# 2. How would you add the number `7` to Erik's favorite numbers?
users["Erik"][:favorite_numbers].push(7) # => [8, 12, 24, 7]
users["Erik"][:favorite_numbers] # => [8, 12, 24, 7]

# 3. How would you add yourself to the users hash?
users["Alex"] = {
  :twitter => "sonna",
  :favorite_numbers => [0, 1, 2, 5, 42, 101010],
}
users
# => {"Jonathan"=>{:twitter=>"tronathan", :favorite_numbers=>[12, 42, 75]},
#     "Erik"=>{:twitter=>"sferik", :favorite_numbers=>[8, 12, 24, 7]},
#     "Anil"=>{:twitter=>"bridgpal", :favorite_numbers=>[12, 14, 85]},
#     "Alex"=>{:twitter=>"sonna", :favorite_numbers=>[0, 1, 2, 5, 42, 101010]}}

# 4. How would you return the array of Erik's favorite numbers?
users["Erik"][:favorite_numbers] # => [8, 12, 24, 7]

# 5. How would you return the smallest of Erik's favorite numbers?
users["Erik"][:favorite_numbers].min # => 7

# 6. How would you return an array of Anil's favorite numbers that are also even?
users["Anil"][:favorite_numbers].select { |number| number.even? } # => [12, 14]
users["Anil"][:favorite_numbers].select(&:even?) # => [12, 14]

# 7. How would you return an array of the favorite numbers common to all users?
users["Alex"][:favorite_numbers].push(12)

common_favourite_numbers = users.reduce(users["Jonathan"][:favorite_numbers]) do |memo, (_name, user)|
 memo & user[:favorite_numbers]
end
common_favourite_numbers # => [12]

# 8. How would you return an array containing all users' favorite numbers, sorted,
#    and excluding duplicates?

users.flat_map { |_name, user| user[:favorite_numbers] }.uniq
# => [12, 42, 75, 8, 24, 7, 14, 85, 0, 1, 2, 5, 101010]
