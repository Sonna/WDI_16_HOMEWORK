# require "dotenv/load"
require "dotenv"
Dotenv.load File.join(File.dirname(__FILE__), ".env")

require "httparty"

# result = HTTParty.get("https://omdbapi.com/?t=once&apikey=#{ENV['API_KEY']}")
result = HTTParty.get("https://omdbapi.com/?s=once&apikey=#{ENV['API_KEY']}")
result.parsed_response
# => {"Search"=>
#      [{"Title"=>"Once Upon a Time in America",
#        "Year"=>"1984",
#        "imdbID"=>"tt0087843",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time in the West",
#        "Year"=>"1968",
#        "imdbID"=>"tt0064116",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://m.media-amazon.com/images/M/MV5BZGI5MjBmYzYtMzJhZi00NGI1LTk3MzItYjBjMzcxM2U3MDdiXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time",
#        "Year"=>"2011–2018",
#        "imdbID"=>"tt1843230",
#        "Type"=>"series",
#        "Poster"=>
#         "https://m.media-amazon.com/images/M/MV5BNjBmZmI0ZDktODI2MS00MDU1LTk0NDYtNGE0MDc0OWVkYzcwXkEyXkFqcGdeQXVyMzAzNTY3MDM@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time in Mexico",
#        "Year"=>"2003",
#        "imdbID"=>"tt0285823",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BMTU5MDg5OTcwOV5BMl5BanBnXkFtZTcwMjI1MTIzMw@@._V1_SX300.jpg"},
#       {"Title"=>"Once",
#        "Year"=>"2007",
#        "imdbID"=>"tt0907657",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BYWUxZjJkMDktZmMxMS00Mzg3LTk4MDItN2IwODlmN2E0MTM0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"},
#       {"Title"=>"Lagaan: Once Upon a Time in India",
#        "Year"=>"2001",
#        "imdbID"=>"tt0169102",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BNDYxNWUzZmYtOGQxMC00MTdkLTkxOTctYzkyOGIwNWQxZjhmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time in Anatolia",
#        "Year"=>"2011",
#        "imdbID"=>"tt1827487",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://images-na.ssl-images-amazon.com/images/M/MV5BNWZhNDUwZTgtMWMwZS00OTFkLWFhOTAtYTZhZDAwZTVhZmI5XkEyXkFqcGdeQXVyMjgyNjk3MzE@._V1_SX300.jpg"},
#       {"Title"=>"Once Were Warriors",
#        "Year"=>"1994",
#        "imdbID"=>"tt0110729",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://images-na.ssl-images-amazon.com/images/M/MV5BMjAzODA3MzE4NF5BMl5BanBnXkFtZTcwMjIwMzAwMQ@@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time in China",
#        "Year"=>"1991",
#        "imdbID"=>"tt0103285",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BYjE1MTlmMjgtMTJmZS00MjkzLTgxZTctYTQ2ODVkNWIxMzk2XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"},
#       {"Title"=>"Once Upon a Time in Mumbai",
#        "Year"=>"2010",
#        "imdbID"=>"tt1395054",
#        "Type"=>"movie",
#        "Poster"=>
#         "https://ia.media-imdb.com/images/M/MV5BMTAwMTg1NzY3NDReQTJeQWpwZ15BbWU3MDQ2NzQxNzM@._V1_SX300.jpg"}],
#     "totalResults"=>"998",
#     "Response"=>"True"}
