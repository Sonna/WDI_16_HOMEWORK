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

  def movie
    result = prepare_sql("find_movie", find_sql, title).first

    if result
      result["response"] = "True"
    else
      result = find_by_external_api_request
      prepare_sql("create_movie", create_sql, *filtered_params(result)) unless result["Error"]
    end

    result.transform_keys { |key| key.downcase.to_sym }
  end

  def title
    params['title']
  end

  def to_template
    erb :movie, layout: :layout, locals: {
      response: movie[:response] == "True",
      param_title: title,

      title: movie[:title],
      year: movie[:year],
      rated: movie[:rated],
      released: movie[:released],
      runtime: movie[:runtime],
      genre: movie[:genre],
      director: movie[:director],
      writer: movie[:writer],
      actors: movie[:actors],
      plot: movie[:plot],
      language: movie[:language],
      poster_url: movie[:poster],
      imdb_rating: Rating.new(movie[:imdbrating].to_f),
      imdb_votes: movie[:imdbvotes],
      production: movie[:production],

      result: movie,
      error_message: movie[:error]
    }
  end
end

def movie_show(params)
  MovieShowAction.new(params).to_template
end
