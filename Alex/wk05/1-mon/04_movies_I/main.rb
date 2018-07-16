$LOAD_PATH.push File.expand_path('../', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "uri"

require "rating"

Dotenv.load File.join(File.dirname(__FILE__), ".env")

get "/" do
  erb :index
end

post "/" do
  redirect "/#{URI::encode(params['movie_name'])}"
end

get "/about" do
  erb :about
end

get "/:title" do
  result = HTTParty.get("https://omdbapi.com/?t=#{params['title']}&apikey=#{ENV['API_KEY']}")
  erb :movie, locals: {
    response: result["Response"] == "True",
    param_title: params['title'],

    title: result["Title"],
    year: result["Year"],
    rated: result["Rated"],
    released: result["Released"],
    runtime: result["Runtime"],
    genre: result["Genre"],
    director: result["Director"],
    writer: result["Writer"],
    actors: result["Actors"],
    plot: result["Plot"],
    language: result["Language"],
    poster_url: result["Poster"],
    imdb_rating: Rating.new(result["imdbRating"].to_f),
    imdb_votes: result["imdbVotes"],
    production: result["Production"],
    result: result.parsed_response
  }
end
