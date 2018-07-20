class MovieShowAction
  include ErbRender

  attr_reader :params, :service

  def self.call(context)
    new(context.params).to_template
  end

  def initialize(params, service = MovieService)
    @params = params
    @service = service
  end

  def locals
    {
      response: movie[:response] == "True",
      param_title: params[:title],

      poster_url: movie[:poster],
      imdb_rating: Rating.new(movie[:imdbrating].to_f),
      imdb_votes: movie[:imdbvotes],

      result: movie,
      error_message: movie[:error]
    }.merge(movie)
  end

  def movie
    @movie ||= service.call(params)
  end

  def to_template
    erb :movie, layout: :layout, locals: locals
  end
end
