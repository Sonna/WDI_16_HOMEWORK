require 'sinatra'
require 'sinatra/reloader'
require 'stock_quote'

get '/' do
  @stock = StockQuote::Stock.quote(params['stock_symbol'])
  erb :index
end
