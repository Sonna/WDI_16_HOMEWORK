# sourced:
# - https://stackoverflow.com/questions/2402017/call-sinatra-erb-from-another-class
#
module ErbRender
  include Sinatra::Templates
  include Sinatra::Helpers

  def settings
    @settings ||= MovieApp.settings.tap do |settings|
      # settings = Sinatra::Application.settings
      settings.root = "#{ROOT}"
      # settings.views = File.join(settings.root, "/lib/templates")
    end
  end

  def template_cache
    @template_cache ||= Tilt::Cache.new
  end
end
