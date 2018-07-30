require "lib/services/movie_service"
require "lib/vendor/erb_render"
require "lib/views/rating"

module Action
  module Movie
    class Show
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
          title: params[:title],
          rating: Rating.new(movie[:imdbrating].to_f),
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
  end
end
