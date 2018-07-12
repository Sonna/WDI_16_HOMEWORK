require 'sinatra'
require 'sinatra/reloader'


# ## Project Specs

# create the 99 bottles of beer song in the form of a sinatra web application.

# - The home page `/` should list:
#   - "99 Bottles of beer on the wall"
#   - add a link to take one down
# - The page `/:num_bottles` should show:
#   - `:num_bottles` bottles of beer on the wall"
#   - where `:num_bottles` can be any positive integer.
#   - add a link to take one down
# - The page `/0` should show:
#   - "No Bottles of beer on the wall"
#   - do not show a link to take one down
#   - show a link to start over

BEER_BOTTLES = 99

get '/' do
  redirect "/#{BEER_BOTTLES}"
end

get '/0' do
  erb :zero
end

get '/:num_bottles' do
  @num_of_bottles = params[:num_bottles].to_i
  erb :index
end
