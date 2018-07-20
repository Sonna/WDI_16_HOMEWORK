$LOAD_PATH.push File.expand_path('../', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
# require "sinatra"
require "sinatra/base"
require "sinatra/reloader"
require "uri"

require "actions/movie_index"
require "actions/movie_show"

require "lib/external_api"
require "lib/pagination"
require "lib/rating"
require "lib/repositories/base_repository"
require "lib/repositories/movie_repository"
require "lib/services/movie_service"
require "lib/services/search_service"
require "lib/psql"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

class MovieApp < Sinatra::Base
  get("/") { MovieIndexAction.call(self) }
  get("/about") { erb :about }
  get("/:title") { MovieShowAction.call(self) }
end
