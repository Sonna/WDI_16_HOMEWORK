require 'pg'

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  @dishes = conn.exec("SELECT * FROM dishes;")
  conn.close
  erb :index
end

get '/about' do
end

# get '/create_dish' do
# end

# getting the form
get '/dishes/new' do
  erb :new
end

# create a dish
post '/dishes' do
  # "should create dish now"
  # params.to_s

  # how?
  # inputs from the form - params
  # sql - insert
  # sql = "INSERT INTO dishes () VALUES ();"
  # sql = "INSERT INTO dishes (name, image_url) VALUES ('pudding', 'http://.../.png');"
  sql = "INSERT INTO dishes (name, image_url) VALUES ('#{ params[:name] }', '#{ params[:image_url] }');"

  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  conn.exec(sql)

  # 'yay'
  # get post redirect
  redirect '/' # needs to a route - because its making a request
ensure
  conn.close
end

# delete a dish
delete '/dishes' do
end

get '/dishes/:id' do
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  sql = "SELECT * FROM dishes WHERE id = #{ params[:id] };"
  result = conn.exec(sql)
  @dish = result.first
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
ensure
  conn.close
end
