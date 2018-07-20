class MovieShowAction
  include ErbRender

  attr_reader :params

  def initialize(params, external_api = ExternalAPI, repo = MovieRepository)
    @params = params
    @external_api = external_api
    @repo = repo.new
  end

  def find_by_external_api_request
    @external_api.movie_find_by(title: title)
  end

  def filtered_params(result = {}, attributes = [])
    result = result.transform_keys(&:downcase)
    attributes.map { |attribute| result[attribute] }
  end

  def movie
    result = @repo.find(title)

    if result
      result["response"] = "True"
    else
      result = find_by_external_api_request
      @repo.create(filtered_params(result, @repo.attributes)) unless result["Error"]
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
