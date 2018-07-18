require 'uri'

"http://localhost:4567/dishes/" + URI::encode("';DROP DATABASE goodfoodhunting;select'") # !> URI.escape is obsolete
# => "http://localhost:4567/dishes/';DROP%20DATABASE%20goodfoodhunting;select'" # !> URI.escape is obsolete

"http://localhost:4567/dishes/" + URI::encode("';DROP TABLE dishes;select'")
# => "http://localhost:4567/dishes/';DROP%20TABLE%20dishes;select'"
