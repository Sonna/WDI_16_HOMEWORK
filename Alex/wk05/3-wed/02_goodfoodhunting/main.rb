require 'pg'

require 'sinatra'
require 'sinatra/reloader'

def run_sql(sql)
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  result = conn.exec(sql)
  conn.close
  return result
# ensure
#   conn.close
end

get '/' do
  @dishes = run_sql("SELECT * FROM dishes;")
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

  # conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  # conn.exec(sql)
  run_sql(sql)

  # 'yay'
  # get post redirect
  redirect '/' # needs to a route - because its making a request
# ensure
#   conn.close
end

# delete a dish
delete '/dishes/:id' do
  # "danger!!!!"
  sql = "DELETE FROM dishes WHERE id = #{ params[:id] };"
  # return sql

  # conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  # conn.exec(sql)
  run_sql(sql)

  redirect '/'
# ensure
#   conn.close
end

get '/dishes/:id' do
  # conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  sql = "SELECT * FROM dishes WHERE id = #{ params[:id] };"
  result = run_sql(sql)
  @dish = result.first
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
# ensure
#   conn.close
end
