# require "dotenv/load"
require "dotenv"
Dotenv.load File.join(File.dirname(__FILE__), ".env")

require "httparty"

result = HTTParty.get("https://omdbapi.com/?t=once&apikey=#{ENV['API_KEY']}")
result.parsed_response
# => {"Title"=>"Once",
#     "Year"=>"2007",
#     "Rated"=>"R",
#     "Released"=>"15 Jun 2007",
#     "Runtime"=>"86 min",
#     "Genre"=>"Drama, Music, Romance",
#     "Director"=>"John Carney",
#     "Writer"=>"John Carney",
#     "Actors"=>"Glen Hansard, Markéta Irglová, Hugh Walsh, Gerard Hendrick",
#     "Plot"=>
#      "A modern-day musical about a busker and an immigrant and their eventful week in Dublin, as they write, rehearse and record songs that tell their love story.",
#     "Language"=>"English, Czech",
#     "Country"=>"Ireland",
#     "Awards"=>"Won 1 Oscar. Another 22 wins & 30 nominations.",
#     "Poster"=>
#      "https://ia.media-imdb.com/images/M/MV5BYWUxZjJkMDktZmMxMS00Mzg3LTk4MDItN2IwODlmN2E0MTM0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
#     "Ratings"=>
#      [{"Source"=>"Internet Movie Database", "Value"=>"7.9/10"},
#       {"Source"=>"Rotten Tomatoes", "Value"=>"97%"},
#       {"Source"=>"Metacritic", "Value"=>"88/100"}],
#     "Metascore"=>"88",
#     "imdbRating"=>"7.9",
#     "imdbVotes"=>"101,549",
#     "imdbID"=>"tt0907657",
#     "Type"=>"movie",
#     "DVD"=>"18 Dec 2007",
#     "BoxOffice"=>"$9,199,193",
#     "Production"=>"Fox Searchlight",
#     "Website"=>"http://www.foxsearchlight.com/once/",
#     "Response"=>"True"}
