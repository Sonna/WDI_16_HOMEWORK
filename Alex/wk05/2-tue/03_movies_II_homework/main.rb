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
  return erb :index, locals: { response: nil, results: [] } if params['movie_name'].nil?

  page = params['page'] ? params['page'].to_i : 1
  prev_page = page - 1
  next_page = page + 1

  results = HTTParty.get("https://omdbapi.com/?s=#{params['movie_name']}&type=movie&page=#{page}&apikey=#{ENV['API_KEY']}")

  total_results = results['totalResults'].to_i
  last_page = (total_results / 10) + 1
  result_count = (page - 1) * 10
  page_range = ([page - [5, last_page].min, 1].max..[last_page, page + [5, last_page].min].min)

  return erb :index, locals: {
    response: false,
    results: results,
    result_count: result_count,
    curr_page: page,
    page_range: page_range,
    prev_page: prev_page,
    next_page: next_page,
    last_page: last_page,
  } if results['Response'] == 'False' # results['Search'].length.zero?

  redirect "/#{URI::encode(params['movie_name'])}" if results['totalResults'] == "1"

  erb :index, locals: {
    response: true,
    results: results['Search'],
    total_results: total_results,
    result_count: result_count,
    curr_page: page,
    page_range: page_range,
    prev_page: prev_page,
    next_page: next_page,
    last_page: last_page
  }
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
