# require "dotenv/load"
require "dotenv"
Dotenv.load File.join(File.dirname(__FILE__), ".env")

require "httparty"

# result = HTTParty.get("https://omdbapi.com/?t=once&apikey=#{ENV['API_KEY']}")
result = HTTParty.get("https://omdbapi.com/?s=Blade Runner 2049&apikey=#{ENV['API_KEY']}")
result.parsed_response
# => {"Search"=>
#      [{"Title"=>"Blade Runner 2049",
#        "Year"=>"2017",
#        "imdbID"=>"tt1856101",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_SX300.jpg"}],
#     "totalResults"=>"1",
#     "Response"=>"True"}
