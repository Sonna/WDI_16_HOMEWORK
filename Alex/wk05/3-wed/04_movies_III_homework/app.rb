$LOAD_PATH.push File.expand_path('../', __FILE__)

require "dotenv"
require "sinatra/base"
require "sinatra/reloader"

require "actions/movie_index"
require "actions/movie_show"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

class MovieApp < Sinatra::Base
  get("/") { MovieIndexAction.call(self) }
  get("/about") { erb :about }
  get("/:title") { MovieShowAction.call(self) }
end
