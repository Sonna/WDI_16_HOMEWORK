$LOAD_PATH.push File.expand_path('../actions', __FILE__)
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "uri"

require "movie_index"

require "pagination"
require "rating"
require "sql"

Dotenv.load File.join(File.dirname(__FILE__), ".env")

get("/") { movie_index(params) }

get "/about" do
  erb :about
end

get "/:title" do
  title = params['title']
  # Find movie (by title)
  sql = "SELECT * FROM movies WHERE title ILIKE ($1);"
  result = prepare_sql("find_movie", sql, title).first

  # if found
  if result
    # - store in result
    result["response"] = "True"
    result.transform_keys!(&:to_sym)
  # if no result
  else
    # - query remote API
    # - store in result
    result = HTTParty.get(ENV['API_URL'], query: {
      "t" => title,
      "apikey" => ENV['API_KEY']
    })

    # - save result to database
    unless result["Error"]
      sql = <<~SQL
        INSERT INTO movies (
          Title, Year, Rated,
          Released, Runtime, Genre,
          Director, Writer, Actors,
          Plot, Language, Poster,
          imdbRating, imdbVotes,
          Production
        ) VALUES (
          $1, $2, $3, $4,
          $5, $6, $7,
          $8, $9, $10, $11,
          $12, $13, $14,
          $15
        );
      SQL

      prepare_sql(
        "create_movie", sql,
        result["Title"], result["Year"], result["Rated"], result["Released"],
        result["Runtime"], result["Genre"], result["Director"],
        result["Writer"], result["Actors"], result["Plot"], result["Language"],
        result["Poster"], result["imdbRating"], result["imdbVotes"],
        result["Production"]
      )
    end

    result = result.transform_keys { |key| key.downcase.to_sym }
  end

  # render
  erb :movie, locals: {
    response: result[:response] == "True",
    param_title: title,

    title: result[:title],
    year: result[:year],
    rated: result[:rated],
    released: result[:released],
    runtime: result[:runtime],
    genre: result[:genre],
    director: result[:director],
    writer: result[:writer],
    actors: result[:actors],
    plot: result[:plot],
    language: result[:language],
    poster_url: result[:poster],
    imdb_rating: Rating.new(result[:imdbrating].to_f),
    imdb_votes: result[:imdbvotes],
    production: result[:production],

    result: result,
    # result: result.parsed_response,
    error_message: result[:error]
    # error_message: result.parsed_response
  }
end
