require "lib/repositories/movie_repository"
require "lib/vendor/omdbapi"

class MovieService
  ATTRIBUTES = %i(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  ).freeze

  attr_reader :api, :params, :repo

  def self.call(*args)
    self.new(*args).movie
  end

  def initialize(params, api = OMDBAPI, repo = MovieRepository)
    @params = params
    @api = api
    @repo = repo.new
  end

  def movie
    record = repo.find_by_title(title)

    unless record
      result = api.movie_find_by(title: title)
      return result if result[:error]
      record = cache(result)
    end

    record.to_h
  end

  def title
    params[:title]
  end

  private

  def cache(result)
    repo.create(movie_params(result))
  end

  def movie_params(result = {})
    result.transform_keys(&:downcase).select { |k, _v| ATTRIBUTES.include?(k) }
  end
end
