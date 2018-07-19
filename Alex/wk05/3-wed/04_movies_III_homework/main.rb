$LOAD_PATH.push File.expand_path('../', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "uri"

require "actions/movie_index"
require "actions/movie_show"

require "lib/external_api"
require "lib/pagination"
require "lib/rating"
require "lib/sql"

ROOT = File.expand_path('../', __FILE__)

Dotenv.load File.join(ROOT, ".env")

get("/") { movie_index(params) }
get("/about") { erb :about }
get("/:title") { movie_show(params) }
