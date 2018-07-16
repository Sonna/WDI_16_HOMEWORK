# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "uri"

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
    plot: result["Plot"],
    poster_url: result["Poster"],
    result: result.parsed_response
  }
end
