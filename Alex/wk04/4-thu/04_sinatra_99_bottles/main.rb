require 'sinatra'
require 'sinatra/reloader'

BEER_BOTTLES = 99

get '/' do
  @num_of_bottles = BEER_BOTTLES - params['take_down'].to_i
  erb :index
end
