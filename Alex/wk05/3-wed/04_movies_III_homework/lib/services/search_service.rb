class SearchService
  attr_reader :external_api, :params

  def self.call(params)
    new(params).call
  end

  def initialize(params, external_api = ExternalAPI)
    @params = params
    @external_api = external_api
    @results = {}
  end

  def page
    params["page"] ? params["page"].to_i : 1
  end

  def call
    external_api.movie_search_by(title: params["movie_name"], page: page)
  end
end
