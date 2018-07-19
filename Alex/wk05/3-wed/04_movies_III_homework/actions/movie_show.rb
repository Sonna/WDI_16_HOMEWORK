class MovieShowAction
  include ErbRender

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def find_by_external_api_request
    HTTParty.get(
      ENV['API_URL'],
      query: {
        "t" => title,
        "apikey" => ENV['API_KEY']
      }
    )
  end

  def filtered_params(result)
    [
      result["Title"], result["Year"], result["Rated"], result["Released"],
      result["Runtime"], result["Genre"], result["Director"],
      result["Writer"], result["Actors"], result["Plot"], result["Language"],
      result["Poster"], result["imdbRating"], result["imdbVotes"],
      result["Production"]
    ]
  end

  def create_sql
    <<~SQL
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
  end

  def find_sql
    "SELECT * FROM movies WHERE title ILIKE ($1);"
  end

  def result
    movie = prepare_sql("find_movie", find_sql, title).first

    if movie
      movie["response"] = "True"
    else
      movie = find_by_external_api_request
      prepare_sql("create_movie", create_sql, *filtered_params(movie)) unless movie["Error"]
    end

    movie.transform_keys { |key| key.downcase.to_sym }
  end

  def title
    params['title']
  end

  def to_template
    erb :movie, layout: :layout, locals: {
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
      error_message: result[:error]
    }
  end
end

def movie_show(params)
  MovieShowAction.new(params).to_template
end
