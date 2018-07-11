# require "pry"
require "sinatra"
require "sinatra/reloader"

# http request - query string - anything that comes after a question mark
# query string - key value pair
# url https://dt.com:4567/about?name=dt
# params is magical variable that contains your query string pair
# different methods - get

get "/" do
  return '<h1>welcome to my home page</h1><a href="/about">about</a>'
end

get "/about" do
  # return "its me. alex"
  # return "its me. alex #{Time.now}"
  return '<h1>its me. alex</h1><a href="/">home</a>'
end

# localhost:4567/hello?name=slackers
get "/hello" do
  # name = "dt"
  # params['name']

  # return "<h2>hello #{ name }</h2>"
  # return "<h2>hello #{ params['name'] }</h2>"
  return "<h2>Yo #{ params['name'] }</h2>"
end

# if the client request this path - and provide query string num1 & num2
# localhost:4567/crappy_calc?num1=5&num2=6
# respond with the sum of the numbers
get "/crappy_calc" do
  # binding.pry
  sum = params['num1'].to_f + params['num2'].to_f
  return "sum: #{ sum }"

  # your turn
  # return params['num1'] + params['num2']
  # return (params['num1'].to_i + params['num2'].to_i).to_s
end

# get "/" do
#   <<~HTML
#     <!DOCTYPE html>
#     <html>
#     <head>
#       <title>Hello from Sinatra</title>
#     </head>
#     <body>
#       <p>Yo!</p>
#     </body>
#     </html>
#   HTML
# end
