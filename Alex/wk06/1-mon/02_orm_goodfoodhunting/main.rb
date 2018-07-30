$LOAD_PATH.push File.expand_path('../', __FILE__)

require 'pg'

require 'sinatra'
require 'sinatra/reloader' # only reloads this file by default

require "db_config"
require "models/dish"
require "models/comment"
require "models/like"
require "models/user"

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end

get '/' do
  @dishes = Dish.all
  erb :index
end

get '/about' do
end

# getting the form
get '/dishes/new' do
  erb :new
end

# create a dish
post '/dishes' do
  Dish.create(name: params[:name], image_url: params[:image_url])
  redirect '/'
end

# delete a dish
delete '/dishes/:id' do
  Dish.destroy(params[:id])
  redirect '/'
end

# showing single dish by id
get '/dishes/:id' do
  @dish = Dish.find(params[:id])
  @comments = @dish.comments
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
end

get '/dishes/:id/edit' do
  @dish = Dish.find(params[:id])
  erb :edit
end

# updates an existing dish
put '/dishes/:id' do
  Dish.find(params[:id]).update(name: params[:name], image_url: params[:image_url])
  redirect '/'
end

# get "/session/new" do
get "/login" do
  erb :login
end

post "/session" do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

delete "/session" do
  session[:user_id] = nil
  redirect '/login'
end

get "/users/new" do
  erb :signup
end

post "/users" do
  user = User.new(email: params[:email], password: params[:password])
  redirect "/" if user.valid? && user.save
  erb :signup
end

post "/likes" do
  redirect '/login' unless logged_in?

  # like = Like.new
  # like.dish_id = params[:dish_id]
  # like.user_id = params[:user_id]
  # like.save

  # like = Like.new(dish_id: params[:dish_id], user_id: params[:user_id])
  Like.find_or_create_by(dish_id: params[:dish_id], user_id: current_user.id)

  redirect "/dishes/#{params[:dish_id]}"
end
