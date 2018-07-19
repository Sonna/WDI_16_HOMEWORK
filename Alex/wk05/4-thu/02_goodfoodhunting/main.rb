require 'pg'

require 'sinatra'
require 'sinatra/reloader'

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

def prepare_sql(name, sql)
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  conn.prepare(name, sql)
  # yield conn
  # args = yield
  # conn.exec_prepared(name, args)
  conn.exec_prepared(name, yield)
  conn.close
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

# showing single dish by id
get '/dishes/:id' do
  # conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  sql = "SELECT * FROM dishes WHERE id = #{ params[:id] };"
  result = run_sql(sql)
  @dish = result.first
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
# ensure
#   conn.close
end

get '/dishes/:id/edit' do
  # return "edit form"
  result = run_sql("SELECT * FROM dishes WHERE id = #{ params[:id] };")
  @dish = result.first

  erb :edit
end

# updates an existing dish
put '/dishes/:id' do
  # prepare_sql("update_dish", "UPDATE dishes SET name = $1, image_url = $2 where id = $3;") do |conn|
    # conn.exec_prepared("update_dish", [params[:name], params[:image_url], params[:id]])
  prepare_sql("update_dish", "UPDATE dishes SET name = $1, image_url = $2 where id = $3;") do
    [params[:name], params[:image_url], params[:id]]
  end

  redirect '/'
end
