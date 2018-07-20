$LOAD_PATH.push File.expand_path('../', __FILE__)

require 'pg'

require 'sinatra'
require 'sinatra/reloader'

require "db_config"
require "models/comment"
require "models/dish"
require "models/user"

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    # if current_user # user object or nil
    #   return true
    # else
    #   return false
    # end
    !!current_user
  end
end

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

# get "/session/new" do
get "/login" do
  erb :login
end

post "/session" do
  # grab email & password
  # find the user by email
  user = User.find_by(email: params[:email])
  # authenticate user with password
  if user && user.authenticate(params[:password])
    # create a new session
    session[:user_id] = user.id
    # redirect (to secret page)
    redirect '/'
  else
    erb :login
  end
end

delete "/session" do
  # delete the session
  session[:user_id] = nil
  # redirect to /login
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
