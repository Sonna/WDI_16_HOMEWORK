ROOT = File.expand_path("../", __FILE__)
$LOAD_PATH.push ROOT

require "dotenv"
require "sinatra/base"
require "sinatra/reloader"

require "lib/actions"

Dotenv.load File.join(ROOT, ".env")

class MovieApp < Sinatra::Base
  set(:views, File.join(ROOT, "/lib/templates"))

  get("/") { Action::Movie::Index.call(self) }
  get("/about") { erb :about }
  get("/:title") { Action::Movie::Show.call(self) }
end
