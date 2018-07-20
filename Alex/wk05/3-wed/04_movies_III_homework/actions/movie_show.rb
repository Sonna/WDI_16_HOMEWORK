class MovieShowAction
  include ErbRender

  attr_reader :params

  def initialize(params, external_api = ExternalAPI)
    @params = params
    @external_api = external_api
  end

  def find_by_external_api_request
    @external_api.movie_find_by(title: title)
  end

  ATTRIBUTES = %w(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  )

  def filtered_params(result, attributes = ATTRIBUTES)
    result = result.transform_keys(&:downcase)
    attributes.map { |attribute| result[attribute] }
  end

  def create_sql(table = "movies", attributes = ATTRIBUTES)
    <<~SQL
      INSERT INTO #{ table } (
        #{ attributes.join(',') }
      ) VALUES (
        #{ attributes.map.with_index(1) { |_, i| "$#{i}" }.join(",") }
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

      poster_url: movie[:poster],
      imdb_rating: Rating.new(movie[:imdbrating].to_f),
      imdb_votes: movie[:imdbvotes],

      result: movie,
      error_message: movie[:error]
    }.merge(movie)
  end
end

def movie_show(params, external_api = ExternalAPI)
  MovieShowAction.new(params, external_api).to_template
end
