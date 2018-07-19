$LOAD_PATH.push File.expand_path('../', __FILE__)

require 'pg'

require 'sinatra'
require 'sinatra/reloader'

require "db_config"
require "models/dish"
require "models/comment"

# class Dish

#   def self.all
#     # connect db
#     # work which table
#     #
#   end

# end

# d1 = Dish.new
# d2 = Dish.new
# d1.name
# Dish.all

#                |    get '/dishes/:id'      | show
# show new form  |    get '/dishes/new'      | new
# create dish    |   post '/dishes'          | redirect
#                | delete '/dishes/new'      | redirect
# show edit form |    get '/dishes/:id/edit' | edit
# update dish    |    put '/dishes/:id'      | redirect

def run_sql(sql)
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  result = conn.exec(sql)
  conn.close
  return result
# ensure
#   conn.close
end

def prepare_sql(name, sql, *args)
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  conn.prepare(name, sql)
  # yield conn
  # args = yield
  # conn.exec_prepared(name, args)
  conn.exec_prepared(name, args)
  conn.close
# ensure
#   conn.close
end

get '/' do
  @dishes = Dish.all # run_sql("SELECT * FROM dishes;")
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
  # sql = "INSERT INTO dishes (name, image_url) VALUES ('#{ params[:name] }', '#{ params[:image_url] }');"
  Dish.create(name: params[:name], image_url: params[:image_url])
  redirect '/' # needs to a route - because its making a request
end

# delete a dish
delete '/dishes/:id' do
  # "danger!!!!"
  Dish.destroy(params[:id]) # "DELETE FROM dishes WHERE id = #{ params[:id] };"

  redirect '/'
end

# showing single dish by id
get '/dishes/:id' do
  @dish = Dish.find(params[:id]) # "SELECT * FROM dishes WHERE id = #{ params[:id] };"
  @comments = @dish.comments
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
end

get '/dishes/:id/edit' do
  # return "edit form"
  result = run_sql("SELECT * FROM dishes WHERE id = #{ params[:id] };")
  @dish = result.first

  erb :edit
end

# updates an existing dish
put '/dishes/:id' do
  prepare_sql("update_dish", "UPDATE dishes SET name = $1, image_url = $2 where id = $3;",
              [params[:name], params[:image_url], params[:id]])

  redirect '/'
end
