$LOAD_PATH.push File.expand_path('../', __FILE__)

# pry session with your data models loaded

# require "pry"
require "db_config"
require "models/comment"
require "models/dish"
require "models/user"

User # => User (call 'User.connection' to establish a connection)
u1 = User.new # => #<User id: nil, email: nil, password_digest: nil>

# Fixed error message:
# ~ > /Users/Sonna/.rbenv/versions/2.5.1/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb:122:in `require': cannot load such file -- bcrypt (LoadError)
u1.password # => nil

u1.email = "dt@ga.co"
u1.password = "pudding"
u1.password # => "pudding"
u1.password_digest # => "$2a$10$KxIAekVsBAk0F/BD7pU0Muf7PW96FlWGazaH43ytGQjkeEboKRSM2"

# Saved once before
# u1.save # = > true
u = User.find(1) # => #<User id: 1, email: "dt@ga.co", password_digest: "$2a$10$QvEwCixvxIq1rkadt5B/QeUKW0ECX0HSg52PXdDJuTm...">

u.authenticate("cake") # => false
u.authenticate("pudding") # => #<User id: 1, email: "dt@ga.co", password_digest: "$2a$10$QvEwCixvxIq1rkadt5B/QeUKW0ECX0HSg52PXdDJuTm...">

User.all
# => [#<User:0x00007fe7aa98d0c0
#      id: 1,
#      email: "dt@ga.co",
#      password_digest:
#       "$2a$10$QvEwCixvxIq1rkadt5B/QeUKW0ECX0HSg52PXdDJuTm/3ccmlAmo6">]
