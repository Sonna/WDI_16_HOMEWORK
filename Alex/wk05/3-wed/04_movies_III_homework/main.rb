$LOAD_PATH.push File.expand_path('../', __FILE__)

# require "dotenv/load"
require "dotenv"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "uri"

require "rating"
require "pagination"

Dotenv.load File.join(File.dirname(__FILE__), ".env")

API_URL = "https://omdbapi.com/".freeze

def conn_sql
  conn = PG.connect(dbname: ENV["DB_NAME"], port: ENV["DB_PORT"],
                    user: ENV["DB_USER"], hostaddr: ENV["DB_ADDR"])
  yield conn
ensure
  conn.close
end

def run_sql(sql)
  conn_sql { |conn| conn.exec(sql) }
end

def prepare_sql(name, sql, *args)
  conn_sql do |conn|
    conn.prepare(name, sql)
    conn.exec_prepared(name, args)
  end
end

get "/" do
  return erb :index, locals: { response: nil, results: [] } if params['movie_name'].nil?

  page = params['page'] ? params['page'].to_i : 1

  results = HTTParty.get(API_URL, query: {
    's' => params['movie_name'],
    'type' => 'movie',
    'page' => page,
    'apikey' => ENV['API_KEY']
  })
  pagination = Pagination.new(
    total_items: results['totalResults'],
    items_per_page: 10,
    current_page: params['page']
  )

  locals = {
    response: true,
    results: results['Search'],
    total_results: pagination.total_items,
    result_count: pagination.result_count,
    pagination: pagination.to_h
  }

  return erb(:index, locals: locals.merge({
    response: false
  })) if results['Response'] == 'False' # results['Search'].length.zero?

  redirect "/#{URI::encode(params['movie_name'])}" if results['totalResults'] == "1"

  erb(:index, locals: locals)
end

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
    result = HTTParty.get(API_URL, query: {
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
