require "sinatra"
require "sinatra/reloader"
require "stock_quote"

# localhost:4567/?stock=appl
get "/" do #        v
  # params = { 'stock' => 'MSFT' } # Sinatra provides this `params`
  @stock = params['stock']
  @quote = StockQuote::Stock.quote(@stock) # || nil
  if @quote
    return erb(:index)
  else
    return erb(:bananas) #, locals: { quote: quote, stock: stock }
  end
end

# get "/index"
get "/stock_request" do
  return erb(:bananas)
end
