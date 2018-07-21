require "lib/vendor/omdbapi"

class SearchService
  attr_reader :api, :params

  def self.call(params)
    new(params).call
  end

  def initialize(params, api = OMDBAPI)
    @params = params
    @api = api
  end

  def page
    params["page"] ? params["page"].to_i : 1
  end

  def call
    return { search: [], error: "Null Results", totalresults: "0" } if params["movie_name"].nil?
    api.movie_search_by(title: params["movie_name"], page: page)
  end
end
