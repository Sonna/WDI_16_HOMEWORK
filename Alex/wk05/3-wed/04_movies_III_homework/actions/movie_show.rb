class MovieShowAction
  include ErbRender

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def to_template
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
