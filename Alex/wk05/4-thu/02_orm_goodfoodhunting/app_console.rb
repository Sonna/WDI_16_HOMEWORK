$LOAD_PATH.push File.expand_path('../', __FILE__)

# pry session with your data models loaded

# require "pry"
require "db_config"
require "models/dish"

# binding.pry
Dish # => Dish (call 'Dish.connection' to establish a connection)
Dish.first # => #<Dish id: 2, name: "can't believe it's pudding pudding", image_url: "https://www.bbcgoodfood.com/sites/default/files/st...">
Dish.first.class # => Dish(id: integer, name: string, image_url: string)

Dish.find(3)
# => #<Dish:0x00007f92b4293f58
#     id: 3,
#     name: "sandwich",
#     image_url:
#      "http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg">

Dish.find_by(name: "pancakes")
# => #<Dish:0x00007f92b6042248
#     id: 5,
#     name: "pancakes",
#     image_url:
#      "https://img.taste.com.au/q34WYzLy/w720-h480-cfill-q80/taste/2016/11/basic-pancakes-78986-1.jpeg">

d1 = Dish.new
d1.name = "milk tea"
d1 # => #<Dish id: nil, name: "milk tea", image_url: nil>

# d1.save # = > true
Dish.count # => 5
