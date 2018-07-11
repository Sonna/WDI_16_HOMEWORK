# ---
# source:
# - title: hashes.md
#   url: https://gist.github.com/epoch/d5940ff7ace0d2f485cb
# ---

# ...

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

users["Jonathan"][:twitter] # => "tronathan"

users["Erik"][:favorite_numbers].push(7) # => [8, 12, 24, 7]
users["Erik"][:favorite_numbers] # => [8, 12, 24, 7]

users['dt'] = "hello" # => "hello"
users
# => {"Jonathan"=>{:twitter=>"tronathan", :favorite_numbers=>[12, 42, 75]},
#     "Erik"=>{:twitter=>"sferik", :favorite_numbers=>[8, 12, 24, 7]},
#     "Anil"=>{:twitter=>"bridgpal", :favorite_numbers=>[12, 14, 85]},
#     "dt"=>"hello"}

users[:slackers] = 'wdi16' # => "wdi16"
users
# => {"Jonathan"=>{:twitter=>"tronathan", :favorite_numbers=>[12, 42, 75]},
#     "Erik"=>{:twitter=>"sferik", :favorite_numbers=>[8, 12, 24, 7]},
#     "Anil"=>{:twitter=>"bridgpal", :favorite_numbers=>[12, 14, 85]},
#     "dt"=>"hello",
#     :slackers=>"wdi16"}

users['dt'] = { twitter: "superuser", account: {} } # => {:twitter=>"superuser", :account=>{}}
users
# => {"Jonathan"=>{:twitter=>"tronathan", :favorite_numbers=>[12, 42, 75]},
#     "Erik"=>{:twitter=>"sferik", :favorite_numbers=>[8, 12, 24, 7]},
#     "Anil"=>{:twitter=>"bridgpal", :favorite_numbers=>[12, 14, 85]},
#     "dt"=>{:twitter=>"superuser", :account=>{}},
#     :slackers=>"wdi16"}

arr = []
users["Anil"][:favorite_numbers].each do |number|
  if number.even?
    arr << number
  end
end

# checkout arr
arr # => [12, 14]

arr = users["Anil"][:favorite_numbers].select do |number|
  number.even?
end
arr # => [12, 14]

users["Anil"][:favorite_numbers].select(&:even?) # => [12, 14]
# ^ this is technically slower (calling `to_proc`) than passing a block

[1,2,3] + [3,4,5] # => [1, 2, 3, 3, 4, 5]
[1,2,3] - [3,4,5] # => [1, 2]
[1,2,3] & [3,4,5] # => [3]
[1,2,3] | [3,4,5] # => [1, 2, 3, 4, 5]

[1,2,3] & [3,4,5] & [3,6,7] # => [3]

result = users.values.map do |hash|
  return hash[:favorite_numbers]
end #.flatten.uniq.sort
result # =>
