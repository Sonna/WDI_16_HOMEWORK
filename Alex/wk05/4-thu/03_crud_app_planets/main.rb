$LOAD_PATH.push File.expand_path('../', __FILE__)

require "pg"

require "sinatra"
require "sinatra/reloader"

require "db_config"
require "models/planet"

get '/' do
  @planets = Planet.all
  erb :index
end

get '/planets/new' do
  erb :new
end

post '/planets' do
  Planet.create(name: params[:name], image_url: params[:image_url])
  redirect '/'
end

delete '/planets/:id' do
  Planet.destroy(params[:id])
  redirect '/'
end

get '/planets/:id' do
  @planet = Planet.find(params[:id])
  erb :show, locals: { name: @planet["name"], image_url: @planet["image_url"] }
end

get '/planets/:id/edit' do
  @planet = Planet.find(params[:id])
  erb :edit
end

put '/planets/:id' do
  planet = Planet.find(params[:id])
  planet&.update(name: params[:name], image_url: params[:image_url])
  redirect '/'
end
