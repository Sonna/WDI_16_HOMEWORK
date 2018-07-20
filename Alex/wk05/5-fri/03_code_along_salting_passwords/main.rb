$LOAD_PATH.push File.expand_path('../', __FILE__)

require 'pg'

require 'sinatra'
require 'sinatra/reloader'

require "db_config"
require "models/dish"
require "models/comment"

enable :sessions

get '/' do
  @dishes = Dish.all
  erb :index
end

get '/about' do
end

get '/dishes/new' do
  erb :new
end

post '/dishes' do
  Dish.create(name: params[:name], image_url: params[:image_url])
  redirect '/'
end

delete '/dishes/:id' do
  Dish.destroy(params[:id])
  redirect '/'
end

get '/dishes/:id' do
  @dish = Dish.find(params[:id])
  @comments = @dish.comments
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
end

get '/dishes/:id/edit' do
  @dish = Dish.find(params[:id])
  erb :edit
end

put '/dishes/:id' do
  Dish.find(params[:id]).update(name: params[:name], image_url: params[:image_url])
  redirect '/'
end
