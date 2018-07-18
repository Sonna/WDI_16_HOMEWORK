# sourced:
# - https://stackoverflow.com/questions/2402017/call-sinatra-erb-from-another-class
#
module ErbRender
  include Sinatra::Templates
  include Sinatra::Helpers

  def settings
    @settings ||= begin
      settings = Sinatra::Application.settings
      settings.root = "#{ROOT}"
      settings
    end
  end

  def template_cache
    @template_cache ||= Tilt::Cache.new
  end
end
