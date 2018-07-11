# ---
# source:
# - title: stocks.md
#   url: https://gist.github.com/epoch/54a95fe5c4d595a3285bfb29490923f2
# ---

require "sinatra"
require "sinatra/reloader"
require "stock_quote"

# # RIP Yahoo Finance welcome Google overlords Stock App

# - Build a Sinatra App that will take a stock symbol and display the stock
#   price
# - The stock symbol e.g. ```APPL``` should be inputted via the url as query
#   string
# - The result should be rendered in the browswer with ERB.
# - The background colour should be mistyrose.

# ### Suggested Approach

# - Build a Sinatra application
#   - Include:
#     - main.rb
#     - views/index.erb
#     - public/styles.css

# - Define a method that makes a request to the `Google Finance` api via the
#   `stock_quote` gem.
#   - This method should take, as paramater, a stock ticker
#   - This method should return data about the stock
#   - Test this method manually in pry

# - Display, for example, google's stock price when there is `GET` request to
#   `/?stock=APPL`
#   - The file should be `index.erb`

# - Add an about page that contains "goodbye to yahoo finance" in a paragraph.

# - All the above should work without the need of any form input.

# #### install the google finance gem

# ```shell
# $ gem install stock_quote
# ```

# #### ***Example stock_quote library usage:***

# ```ruby
# require 'stock_quote'
# stock = StockQuote::Stock.quote("msft")
# ```

# localhost:4567/?stock=APPL
get "/" do
  quote = StockQuote::Stock.quote(params['stock'])
  erb :index, locals: { quote: quote }
end
