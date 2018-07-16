# require "dotenv/load"
require "dotenv"
Dotenv.load File.join(File.dirname(__FILE__), ".env")

require "httparty"

@movie = HTTParty.get("https://omdbapi.com/?t=sharknado&apikey=#{ENV['API_KEY']}")
@movie['Ratings'] # => [{"Source"=>"Internet Movie Database", "Value"=>"3.3/10"}, {"Source"=>"Rotten Tomatoes", "Value"=>"82%"}]
@movie.fetch('Ratings', []) # => [{"Source"=>"Internet Movie Database", "Value"=>"3.3/10"}, {"Source"=>"Rotten Tomatoes", "Value"=>"82%"}]
@movie.fetch('Ratings', []).find({}) { |rating| rating["Source"] == "Rotten Tomatoes" } # => {"Source"=>"Rotten Tomatoes", "Value"=>"82%"}
@movie.fetch('Ratings', []).find({}) { |rating| rating["Source"] == "Rotten Tomatoes" }.fetch('Value', "n/a") # => "82%"

@movie = HTTParty.get("https://omdbapi.com/?t=blood+rayne&apikey=#{ENV['API_KEY']}")
# => {"Response"=>"False", "Error"=>"Movie not found!"}
@movie['Ratings'] # => nil
@movie.fetch('Ratings', []) # => []
@movie.fetch('Ratings', []).find(-> { Hash.new }) { |rating| rating.fetch("Source", "") == "Rotten Tomatoes" } # => {}
@movie.fetch('Ratings', []).find(-> { Hash.new }) { |rating| rating.fetch("Source", "") == "Rotten Tomatoes" }.fetch('Value', "n/a") # => "n/a"
