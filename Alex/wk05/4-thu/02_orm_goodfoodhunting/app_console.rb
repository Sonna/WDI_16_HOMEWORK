$LOAD_PATH.push File.expand_path('../', __FILE__)

# pry session with your data models loaded

# require "pry"
require "db_config"
require "models/dish"
require "models/comment"

# binding.pry
Dish # => Dish (call 'Dish.connection' to establish a connection)
Dish.all
# => [#<Dish:0x00007ff3d4b16910
#      id: 3,
#      name: "sandwich",
#      image_url:
#       "http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg">,
#     #<Dish:0x00007ff3d4bea120
#      id: 4,
#      name: "macaroon",
#      image_url:
#       "https://www.collinsdictionary.com/images/thumb/macaroon_427440964_250.jpg">,
#     #<Dish:0x00007ff3d4be9fe0
#      id: 5,
#      name: "pancakes",
#      image_url:
#       "https://img.taste.com.au/q34WYzLy/w720-h480-cfill-q80/taste/2016/11/basic-pancakes-78986-1.jpeg">,
#     #<Dish:0x00007ff3d4be9ea0
#      id: 2,
#      name: "can't believe it's pudding pudding",
#      image_url:
#       "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/10/cherry-chocolate-pudding.jpg?itok=dNPboDsi">,
#     #<Dish:0x00007ff3d4be9d60 id: 7, name: "milk tea", image_url: nil>]

Dish.first # => #<Dish id: 2, name: "can't believe it's pudding pudding", image_url: "https://www.bbcgoodfood.com/sites/default/files/st...">
Dish.first.class # => Dish(id: integer, name: string, image_url: string)

Dish.find(3)
# => #<Dish:0x00007ff3d60701f8
#     id: 3,
#     name: "sandwich",
#     image_url:
#      "http://www.chingssecret.com/assets/uploads/images/chings-secret-schezwan-chutney-sandwitch%2003.jpg">

Dish.find_by(name: "pancakes")
# => #<Dish:0x00007ff3d425ce00
#     id: 5,
#     name: "pancakes",
#     image_url:
#      "https://img.taste.com.au/q34WYzLy/w720-h480-cfill-q80/taste/2016/11/basic-pancakes-78986-1.jpeg">

d1 = Dish.new
d1.name = "milk tea"
d1 # => #<Dish id: nil, name: "milk tea", image_url: nil>

# d1.save # = > true
Dish.count # => 5

Comment.first # => #<Comment id: 1, content: "yum", dish_id: 2>
Comment.all # => #<ActiveRecord::Relation [#<Comment id: 1, content: "yum", dish_id: 2>]>

Comment.first.dish # => #<Dish id: 2, name: "can't believe it's pudding pudding", image_url: "https://www.bbcgoodfood.com/sites/default/files/st...">
Dish.first.comments # => #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 1, content: "yum", dish_id: 2>]>

Dish.where(id: 5).to_sql
# => "SELECT \"dishes\".* FROM \"dishes\" WHERE \"dishes\".\"id\" = 5"
