$LOAD_PATH.push File.expand_path('../', __FILE__)

# pry session with your data models loaded

# require "pry"
require "db_config"
require "models/dish"
require "models/comment"
require "models/user"

# binding.pry

dish = Dish.first # => #<Dish id: 2, name: "can't believe it's pudding pudding", image_url: "https://www.bbcgoodfood.com/sites/default/files/st...", user_id: 1>
dish.user_id # => 1
dish.user # => #<User id: 1, email: "dt@ga.co", password_digest: "$2a$10$QvEwCixvxIq1rkadt5B/QeUKW0ECX0HSg52PXdDJuTm...">
dish.user.email # => "dt@ga.co"
