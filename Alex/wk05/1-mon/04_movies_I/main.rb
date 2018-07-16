# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"

Dotenv.load File.join(File.dirname(__FILE__), ".env")

get "/" do
  result = HTTParty.get("https://omdbapi.com/?t=once&apikey=#{ENV['API_KEY']}")
  erb :index, locals: { result: result.parsed_response }
end

get "/about" do
  erb :about
end

get "/:title" do
  result = HTTParty.get("https://omdbapi.com/?t=#{params['title']}&apikey=#{ENV['API_KEY']}")
  erb :movie, locals: {
    title: result["Title"],
    result: result.parsed_response
  }
end
