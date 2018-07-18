$LOAD_PATH.push File.expand_path('../actions', __FILE__)
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "uri"

require "movie_index"
require "movie_show"

require "pagination"
require "rating"
require "sql"

Dotenv.load File.join(File.dirname(__FILE__), ".env")

get("/") { movie_index(params) }
get("/about") { erb :about }
get("/:title") { movie_show }
