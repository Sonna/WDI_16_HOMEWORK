$LOAD_PATH.push File.expand_path('../', __FILE__)

# pry session with your data models loaded

# require "pry"
require "db_config"
require "models/dish"
require "models/comment"
require "models/like"
require "models/user"

# binding.pry

dish = Dish.first # => #<Dish id: 2, name: "can't believe it's pudding pudding", image_url: "https://www.bbcgoodfood.com/sites/default/files/st...", user_id: 1>
dish.user_id # => 1
dish.user # => #<User id: 1, email: "dt@ga.co", password_digest: "$2a$10$QvEwCixvxIq1rkadt5B/QeUKW0ECX0HSg52PXdDJuTm...">
dish.user.email # => "dt@ga.co"

Like.count # => 6

like = Like.new # => #<Like id: nil, user_id: nil, dish_id: nil>
like.dish_id = dish.id
like.user_id = dish.user_id
like.save
like # => #<Like id: 7, user_id: 1, dish_id: 2>

Like.create(user_id: User.last.id, dish_id: Dish.last.id) # => #<Like id: 8, user_id: 2, dish_id: 8>

Like.count # => 8

Like.select { |l| l.dish_id == dish.id }.count # => 4
Like.where(dish_id: dish.id).count # => 4

dish.likes # => #<ActiveRecord::Associations::CollectionProxy [#<Like id: 1, user_id: 1, dish_id: 2>, #<Like id: 3, user_id: 1, dish_id: 2>, #<Like id: 5, user_id: 1, dish_id: 2>, #<Like id: 7, user_id: 1, dish_id: 2>]>
dish.likes.count # => 4
