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
  "should create dish now"
  # return params.to_s
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
