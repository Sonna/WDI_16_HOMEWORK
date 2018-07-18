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

get '/dishes/:dishname' do
  conn = PG.connect(dbname: "goodfoodhunting", port: 5433, user: "postgres", hostaddr: "::")
  sql = "SELECT * FROM dishes WHERE name = '#{ params[:dishname] }';"
  result = conn.exec(sql)
  @dish = result.first
  erb :dish_details, locals: { name: @dish["name"], image_url: @dish["image_url"] }
ensure
  conn.close
end
