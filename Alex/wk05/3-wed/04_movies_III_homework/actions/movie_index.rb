def movie_index(params)
  return erb :index, locals: { response: nil, results: [] } if params['movie_name'].nil?

  page = params['page'] ? params['page'].to_i : 1

  results = HTTParty.get(ENV['API_URL'], query: {
    's' => params['movie_name'],
    'type' => 'movie',
    'page' => page,
    'apikey' => ENV['API_KEY']
  })

  locals = { response: true, results: results['Search'] }

  return erb(:index, locals: locals.merge({
    response: false
  })) if results['Response'] == 'False'

  redirect "/#{URI::encode(params['movie_name'])}" if results['totalResults'] == "1"

  pagination = Pagination.new(
    total_items: results['totalResults'],
    items_per_page: 10,
    current_page: params['page']
  ).to_h

  erb(:index, locals: locals) do
    erb(:pagination, locals: pagination) do
      # erb(:movies, locals: { results: locals[:results] })
      erb(:movies, locals: locals)
    end
  end
end
