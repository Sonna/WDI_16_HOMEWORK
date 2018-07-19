require "lib/erb_render"

class MovieIndexAction
  include ErbRender

  attr_reader :params

  def initialize(params, external_api = ExternalAPI)
    @params = params
    @external_api = external_api
  end

  def search_by_external_api_request
    @external_api.movie_search_by(title: params["movie_name"], page: page)
  end

  def locals
    { response: true, results: results["Search"], error_message: results["Error"] }
  end

  def page
    params["page"] ? params["page"].to_i : 1
  end

  def pagination
    Pagination.new(
      total_items: results["totalResults"],
      items_per_page: 10,
      current_page: params["page"]
    ).to_h
  end

  def results
    @results ||= {}
    @results[[params["movie_name"], page]] ||= search_by_external_api_request
  end

  def to_template
    return erb(:index, layout: :layout, locals: { response: nil, results: [] }) if params["movie_name"].nil?
    return erb(:index, layout: :layout, locals: locals.merge({ response: false })) if results["Response"] == "False"
    redirect %(/#{URI::encode(params["movie_name"])}) if results["totalResults"] == "1"

    erb(:index, layout: :layout, locals: locals) do
      erb(:pagination, locals: pagination) do
        erb(:movies, locals: locals)
      end
    end
  end
end

def movie_index(params, external_api = ExternalAPI)
  MovieIndexAction.new(params, external_api).to_template
end
