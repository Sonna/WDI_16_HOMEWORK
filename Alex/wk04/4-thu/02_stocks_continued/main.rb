require "sinatra"
require "sinatra/reloader"
require "stock_quote"

# localhost:4567/?stock=MSFT
get "/" do
  stock = params['stock']
  quote = StockQuote::Stock.quote(stock)
  erb :index, locals: { quote: quote, stock: stock }
end

# post "/" do
#   redirect "/" + params['stock']
# end
