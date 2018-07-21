class MovieService
  attr_reader :external_api, :params, :repo

  def self.call(*args)
    self.new(*args).movie
  end

  def initialize(params, external_api = ExternalAPI, repo = MovieRepository)
    @params = params
    @external_api = external_api
    @repo = repo.new
  end

  def movie
    result = repo.find_by_title(title)

    if result
      result["response"] = "True"
    else
      result = external_api.movie_find_by(title: title)
      cache(result) unless result["Error"]
    end

    result.transform_keys { |key| key.downcase.to_sym }
  end

  def title
    params["title"]
  end

  private

  def cache(result)
    repo.create(filtered_params(result, repo.attributes))
  end

  def filtered_params(result = {}, attributes = [])
    result = result.transform_keys(&:downcase)
    attributes.map { |attribute| result[attribute] }
  end
end
