class MovieService
  ATTRIBUTES = %w(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  ).freeze

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
    record = repo.find_by_title(title)

    unless record
      result = external_api.movie_find_by(title: title)
      return result.transform_keys { |key| key.downcase.to_sym } if result["Error"]
      record = cache(result).to_h
    end

    record.to_h.tap { |r| r[:response] = "True" }
  end

  def title
    params["title"]
  end

  private

  def cache(result)
    repo.create(movie_params(result))
  end

  def movie_params(result = {})
    result.transform_keys(&:downcase).select { |k, _v| ATTRIBUTES.include?(k) }
  end
end
