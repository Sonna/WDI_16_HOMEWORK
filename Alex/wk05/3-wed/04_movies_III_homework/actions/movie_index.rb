require "uri"

require "lib/erb_render"

class MovieIndexAction
  include ErbRender

  attr_reader :params, :service

  def self.call(context)
    action = new(context.params)
    if action.results[:totalresults].to_i.one?
      context.redirect "/#{URI::encode(action.results[:search].first['Title'])}"
    end
    action.to_template
  end

  def initialize(params, service = SearchService)
    @params = params
    @service = service
  end

  def locals
    {
      error_message: results[:error]
    }.merge(results)
  end

  def page
    params["page"] ? params["page"].to_i : 1
  end

  def pagination
    Pagination.new(
      total_items: results[:totalresults],
      items_per_page: 10,
      current_page: page
    ).to_h
  end

  def results
    @results ||= service.call(params)
  end

  def to_template
    erb(:index, layout: :layout, locals: locals) do
      erb(:pagination, locals: pagination) do
        erb(:movies, locals: locals)
      end
    end
  end
end
