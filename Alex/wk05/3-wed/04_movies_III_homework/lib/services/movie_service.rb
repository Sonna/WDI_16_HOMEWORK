class MovieService
  attr_reader :params, :repo

  def self.call(*args)
    self.new(*args).movie
  end

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
    result = repo.find(title)

    if result
      result["response"] = "True"
    else
      result = find_by_external_api_request
      repo.create(filtered_params(result, repo.attributes)) unless result["Error"]
    end

    result.transform_keys { |key| key.downcase.to_sym }
  end

  def title
    params["title"]
  end
end
