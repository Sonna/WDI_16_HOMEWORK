$LOAD_PATH.push File.expand_path('../', __FILE__)

require "dotenv"
require "sinatra/base"
require "sinatra/reloader"

require "lib/actions"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

class MovieApp < Sinatra::Base
  get("/") { Action::Movie::Index.call(self) }
  get("/about") { erb :about }
  get("/:title") { Action::Movie::Show.call(self) }
end
